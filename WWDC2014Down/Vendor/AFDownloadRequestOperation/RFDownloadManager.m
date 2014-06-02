
#import "RFDownloadManager.h"


@interface RFDownloadManager ()
@property (strong, atomic) NSMutableSet *requrestURLs;
@property (strong, atomic) NSMutableSet *requrestOperationsDownloading;
@property (strong, atomic) NSMutableSet *requrestOperationsQueue;
@property (strong, atomic) NSMutableSet *requrestOperationsPaused;

@property (assign, readwrite, nonatomic) BOOL isDownloading;
@end

@implementation RFDownloadManager
@synthesize delegate = _delegate;
@synthesize isDownloading = _isDownloading;
@synthesize maxRunningTaskCount = _maxRunningTaskCount;
@synthesize shouldResume = _shouldResume;
@synthesize requrestURLs = _requrestURLs;
@synthesize requrestOperationsDownloading = _requrestOperationsDownloading;
@synthesize requrestOperationsQueue = _requrestOperationsQueue;
@synthesize requrestOperationsPaused = _requrestOperationsPaused;

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@: %p, downloading:%@, queue:%@, paused:%@>", [self class], self, self.requrestOperationsDownloading, self.requrestOperationsQueue, self.requrestOperationsPaused];
}

#pragma mark - Property
- (NSSet *)downloadingOperations {
    return [NSSet setWithSet:self.requrestOperationsDownloading];
}

- (NSSet *)operationsInQueue {
    return [NSSet setWithSet:self.requrestOperationsQueue];
}

- (NSSet *)pausedOperations {
    return [NSSet setWithSet:self.requrestOperationsPaused];
}

- (NSSet *)operations {
    return [[self.requrestOperationsDownloading setByAddingObjectsFromSet:self.requrestOperationsQueue] setByAddingObjectsFromSet:self.requrestOperationsPaused];
}

- (void)setMaxRunningTaskCount:(uint)maxRunningTaskCount {
    if (_maxRunningTaskCount != maxRunningTaskCount) {
        //[self willChangeValueForKey:@keypath(self, maxRunningTaskCount)];
        NSInteger diffCount = self.downloadingOperations.count - maxRunningTaskCount;
        if (diffCount > 0) {
            for (NSInteger i = diffCount; i > 0; i--) {
                RFFileDownloadOperation *operation = [self.downloadingOperations anyObject];
                [operation pause];
                [self.requrestOperationsPaused addObject:operation];
                [self.requrestOperationsDownloading removeObject:operation];
            }
        }
        else {
            for (NSInteger i = diffCount; i > 0; i--) {
                [self startNextQueuedOperation];
            }
        }
        _maxRunningTaskCount = maxRunningTaskCount;
        //[self didChangeValueForKey:@keypath(self, maxRunningTaskCount)];
    }
}

#pragma mark -
- (RFDownloadManager *)init {
    self = [super init];
    if (self) {
        _isDownloading = NO;
        _requrestURLs = [NSMutableSet set];
        _requrestOperationsQueue = [NSMutableSet set];
        _requrestOperationsDownloading = [NSMutableSet setWithCapacity:5];
        _requrestOperationsPaused = [NSMutableSet set];
        _maxRunningTaskCount = 3;
        _shouldResume = YES;
    }
    return self;
}

- (RFDownloadManager *)initWithDelegate:(id<RFDownloadManagerDelegate>)delegate {
    self = [self init];
    if (self) {
        self.delegate = delegate;
    }
    return self;
}

+ (instancetype)sharedInstance {
	static RFDownloadManager *sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        sharedInstance = [[self alloc] init];
    });
	return sharedInstance;
}

#pragma mark -
- (RFFileDownloadOperation *)addURL:(NSURL *)url fileStorePath:(NSString *)destinationFilePath {
    if ([self.requrestURLs containsObject:url]) {
        DLog(@"RFDownloadManager: the url already existed. %@", url);
        return nil;
    }

    RFFileDownloadOperation *downloadOperation = [[RFFileDownloadOperation alloc] initWithRequest:[NSURLRequest requestWithURL:url] targetPath:destinationFilePath shouldResume:self.shouldResume shouldCoverOldFile:YES];
    if (downloadOperation == nil) {
        return nil;
    }
    
    [self setupDownloadOperation:downloadOperation];
    [self.requrestOperationsQueue addObject:downloadOperation];
    [self.requrestURLs addObject:url];
    
    return downloadOperation;
}
- (RFFileDownloadOperation *)addOperation:(RFFileDownloadOperation *)operation
{
    [self setupDownloadOperation:operation];
    [self.requrestOperationsQueue addObject:operation];
    [self.requrestURLs addObject:operation.request.URL];
    return operation;
}
- (RFFileDownloadOperation *)findOperationWithURL:(NSURL *)url {
    RFFileDownloadOperation *operation = nil;
    
#define _RFDownloadManagerFindOperationInSet(RequrestOperations)\
    for (operation in RequrestOperations) {\
        if ([operation.request.URL.path isEqualToString:url.path]) {\
            return operation;\
        }\
    }
    
    _RFDownloadManagerFindOperationInSet(self.requrestOperationsDownloading)
    _RFDownloadManagerFindOperationInSet(self.requrestOperationsQueue)
    _RFDownloadManagerFindOperationInSet(self.requrestOperationsPaused)
#undef _RFDownloadManagerFindOperationInSet
    return nil;
}

- (void)setupDownloadOperation:(RFFileDownloadOperation *)downloadOperation {
    __weak RFFileDownloadOperation *aOperation = downloadOperation;
    aOperation.deleteTempFileOnCancel = YES;
    
    [aOperation setProgressiveDownloadProgressBlock:^(RFFileDownloadOperation *operation) {
        if ([self.delegate respondsToSelector:@selector(RFDownloadManager:operationStateUpdate:)]) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.delegate RFDownloadManager:self operationStateUpdate:operation];
            }); 
        }
    }];
    
    [aOperation setCompletionBlockWithSuccess:^(RFFileDownloadOperation *operation, id responseObject) {
        [self onFileDownloadOperationComplete:operation success:YES];
    } failure:^(RFFileDownloadOperation *operation, NSError *error) {
        [self onFileDownloadOperationComplete:operation success:NO];
    }];
}

- (void)onFileDownloadOperationComplete:(RFFileDownloadOperation *)operation success:(BOOL)success {
    [self.requrestOperationsDownloading removeObject:operation];
    [self startNextQueuedOperation];

    if (success) {
        [self.requrestURLs removeObject:operation.request.URL];
        
        if ([self.delegate respondsToSelector:@selector(RFDownloadManager:operationCompleted:)]) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.delegate RFDownloadManager:self operationCompleted:operation];
            });
        }
    }
    else {
        [self.requrestOperationsPaused addObject:operation];
        DLog(@"%@", operation.error);
        
        if ([self.delegate respondsToSelector:@selector(RFDownloadManager:operationFailed:)]) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.delegate RFDownloadManager:self operationFailed:operation];
            });
        }
    }
}

#pragma mark - Queue Manage
- (void)startAll {
    // Paused => Queue
    [self.requrestOperationsQueue unionSet:self.requrestOperationsPaused];
    [self.requrestOperationsPaused removeAllObjects];
    
    // Queue => Start
    while (self.requrestOperationsDownloading.count < _maxRunningTaskCount) {
        RFFileDownloadOperation *operation = [self.requrestOperationsQueue anyObject];
        if (!operation) break;
        
        [self startOperation:operation];
    }
}
- (void)pauseAll {
    RFFileDownloadOperation *operation;
    // Downloading => Pause
    while ((operation = [self.requrestOperationsDownloading anyObject])) {
        [self pauseOperation:operation];
    }
    
    // Queue => Pause
    [self.requrestOperationsPaused unionSet:self.requrestOperationsQueue];
    [self.requrestOperationsQueue removeAllObjects];
}
- (void)cancelAll {
    RFFileDownloadOperation *operation;
    while ((operation = [self.requrestOperationsPaused anyObject])) {
        [self cancelOperation:operation];
    }
    while ((operation = [self.requrestOperationsQueue anyObject])) {
        [self cancelOperation:operation];
    }
    while ((operation = [self.requrestOperationsDownloading anyObject])) {
        [self cancelOperation:operation];
    }
}

- (void)startNextQueuedOperation {
    if (self.requrestOperationsQueue.count > 0 && self.requrestOperationsDownloading.count < self.maxRunningTaskCount) {
        RFFileDownloadOperation *operationNext = [self.requrestOperationsQueue anyObject];
        [self startOperation:operationNext];
    }
}

// Note: 这些方法本身会管理队列
- (void)startOperation:(RFFileDownloadOperation *)operation {
    if (!operation) {
        DLog(@"RFDownloadManager > startOperation: operation is nil")
        return;
    }
    [self.requrestOperationsPaused removeObject:operation];
    if (self.requrestOperationsDownloading.count < self.maxRunningTaskCount) {
        // 开始下载
        if ([operation isPaused]) {
            [operation resume];
        }
        else {
            [operation start];
        }
        
        [self.requrestOperationsDownloading addObject:operation];
        [self.requrestOperationsQueue removeObject:operation];
    }
    else {
        // 加入到队列
        [self.requrestOperationsQueue addObject:operation];
    }
}
- (void)pauseOperation:(RFFileDownloadOperation *)operation {
    if (!operation) {
        DLog(@"RFDownloadManager > pauseOperation: operation is nil")
        return;
    }
    if (![operation isPaused]) {
        [operation pause];
        [self startNextQueuedOperation];
    }
    
    [self.requrestOperationsPaused addObject:operation];
    [self.requrestOperationsQueue removeObject:operation];
    [self.requrestOperationsDownloading removeObject:operation];
}
- (void)cancelOperation:(RFFileDownloadOperation *)operation {
    if (!operation) {
        DLog(@"RFDownloadManager > cancelOperation: operation is nil")
        return;
    }
    [operation cancel];
    
    [self.requrestURLs removeObject:operation.request.URL];
    [self.requrestOperationsDownloading removeObject:operation];
    [self.requrestOperationsQueue removeObject:operation];
    [self.requrestOperationsPaused removeObject:operation];
    [self startNextQueuedOperation];
}

- (void)startOperationWithURL:(NSURL *)url {
    [self startOperation:[self findOperationWithURL:url]];
}
- (void)pauseOperationWithURL:(NSURL *)url {
    [self pauseOperation:[self findOperationWithURL:url]];
}
- (void)cancelOperationWithURL:(NSURL *)url {
    [self cancelOperation:[self findOperationWithURL:url]];
}


@end



#import "RFFileDownloadOperation.h"
#include <fcntl.h>
#include <unistd.h>
//#import "NSFileManager+RFKit.h"
//#import "NSString+RFKit.h"


@interface AFURLConnectionOperation (AFInternal)
@property (strong, nonatomic) NSURLRequest *request;
@property (readonly, nonatomic) long long totalBytesRead;

@end

@interface RFFileDownloadOperation()
@property (strong, nonatomic) NSError *fileError;
@property (strong, nonatomic) NSTimer *stausRefreshTimer;
@property (assign, readwrite) float transmissionSpeed;
@property (strong, nonatomic) NSString *tempPath;
@property (assign) long long totalContentLength;
@property (assign, nonatomic) long long totalBytesReadPerDownload;
@property (assign, nonatomic) long long lastTotalBytesReadPerDownload;
@property (assign) long long offsetContentLength;       // override
@property (copy, nonatomic) void (^progressiveDownloadProgressBlock)(RFFileDownloadOperation *operation);
@end


@implementation RFFileDownloadOperation
@synthesize targetPath = _targetPath;
@synthesize shouldResume = _shouldResume;
@synthesize shouldOverwriteOldFile = _shouldOverwriteOldFile;
@synthesize fileError = _fileError;
@synthesize stausRefreshTimer = _stausRefreshTimer;
@synthesize transmissionSpeed = _transmissionSpeed;
@synthesize tempPath = _tempPath;
@synthesize totalContentLength = _totalContentLength;
@synthesize totalBytesReadPerDownload = _totalBytesReadPerDownload;
@synthesize lastTotalBytesReadPerDownload = _lastTotalBytesReadPerDownload;
@synthesize progressiveDownloadProgressBlock = _progressiveDownloadProgressBlock;

- (NSString *)debugDescription {
    NSString *status = self.isFinished? @"isFinished" : (self.isPaused? @"isPaused" : (self.isExecuting? @"isExecuting" : @"Unexpected"));
    return [NSString stringWithFormat:@"%@: status: %@, speed: %f, %lld/%lld", [self.request.URL lastPathComponent], status, self.transmissionSpeed, self.bytesDownloaded, self.bytesFileSize];
}

- (id)initWithRequest:(NSURLRequest *)urlRequest {
    XXXAssert(false, @"You can`t creat a RFFileDownloadOperation with this method.");
    return nil;
}

- (id)initWithRequest:(NSURLRequest *)urlRequest targetPath:(NSString *)targetPath {
    return [self initWithRequest:urlRequest targetPath:targetPath shouldResume:YES shouldCoverOldFile:YES];
}

- (id)initWithRequest:(NSURLRequest *)urlRequest targetPath:(NSString *)targetPath shouldResume:(BOOL)shouldResume shouldCoverOldFile:(BOOL)shouldOverwriteOldFile {
    XXXAssert(urlRequest != nil && targetPath.length > 0);
    if (!(self = [super initWithRequest:urlRequest])) {
        return nil;
    }
        
    // Check target path
    NSString *destinationPath = nil;
    
    // We assume that at least the directory has to exist on the targetPath
    BOOL isDirectory;
    if(![[NSFileManager defaultManager] fileExistsAtPath:targetPath isDirectory:&isDirectory]) {
        isDirectory = NO;
    }
    // If targetPath is a directory, use the file name we got from the urlRequest.
    if (isDirectory) {
        NSString *fileName = [urlRequest.URL lastPathComponent];
        XXXAssert(fileName.length > 0, @"Cannot decide file name.");
        destinationPath = [NSString pathWithComponents:@[targetPath, fileName]];
    }
    else {
        destinationPath = targetPath;
    }
    
    self.shouldOverwriteOldFile = shouldOverwriteOldFile;
    if (!shouldOverwriteOldFile && [[NSFileManager defaultManager] fileExistsAtPath:destinationPath]) {
        DLog(@"RFFileDownloadOperation: File already exist, and cover option was off.");
        return nil;
    }
    
    _targetPath = destinationPath;
    
    // Download is saved into a temporal file and remaned upon completion
    NSString *tempPath = [self tempPath];
    
    // Do we need to resume the file?
    _shouldResume = shouldResume;
    BOOL isResuming = [self updateByteStartRangeForRequest];
    
    // Try to create/open a file at the target location
    if (!isResuming) {
        int fileDescriptor = open([tempPath UTF8String], O_CREAT | O_EXCL | O_RDWR, 0666);
        if (fileDescriptor > 0) close(fileDescriptor);
    }
    
    self.outputStream = [NSOutputStream outputStreamToFileAtPath:tempPath append:isResuming];
    if (!self.outputStream) {
        DLog(@"Output stream can't be created");
        return nil;
    }
    
    // Give the object its default completionBlock.
    [self setCompletionBlockWithSuccess:nil failure:nil];
    
    // Set defalut value
    _stausRefreshTimeInterval = 1;
    
    return self;
}

// Updates the current request to set the correct start-byte-range.
- (BOOL)updateByteStartRangeForRequest {
    BOOL isResuming = NO;
    if (self.shouldResume) {
        unsigned long long downloadedBytes = [[NSFileManager defaultManager] fileSizeForPath:self.tempPath];
        if (downloadedBytes > 0) {
            NSMutableURLRequest *mutableURLRequest = [self.request mutableCopy];
            NSString *requestRange = [NSString stringWithFormat:@"bytes=%llu-", downloadedBytes];
            [mutableURLRequest setValue:requestRange forHTTPHeaderField:@"Range"];
            self.request = mutableURLRequest;
            isResuming = YES;
        }
    }
    return isResuming;
}




#pragma mark - Control
- (void)start {
    [super start];
    [self activeStausRefreshTimer];
}

- (void)resume {
    [super resume];
    [self activeStausRefreshTimer];
}

- (void)pause {
    [super pause];
    [self deactiveStausRefreshTimer];
    [self updateByteStartRangeForRequest];
}

- (void)cancel {
    [super cancel];
    [self deactiveStausRefreshTimer];
}

- (void)activeStausRefreshTimer {
    if (!self.stausRefreshTimer) {
        self.stausRefreshTimer = [NSTimer scheduledTimerWithTimeInterval:self.stausRefreshTimeInterval target:self selector:@selector(stausRefresh) userInfo:nil repeats:YES];
        
        self.transmissionSpeed = 0;
    }
}

- (void)deactiveStausRefreshTimer {
    if (self.stausRefreshTimer) {
        [self.stausRefreshTimer invalidate];
        self.stausRefreshTimer = nil;
        
        self.transmissionSpeed = 0;
    }
}

- (void)stausRefresh {
    self.transmissionSpeed = (self.totalBytesReadPerDownload - self.lastTotalBytesReadPerDownload)/self.stausRefreshTimeInterval;
    self.lastTotalBytesReadPerDownload = self.totalBytesReadPerDownload;
    if (self.transmissionSpeed < 0) {
      
    }
    //_dout_float(self.transmissionSpeed)
}

#pragma mark - Path

+ (NSString *)cacheFolder {
    static NSString *cacheFolder;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *cacheDir = NSTemporaryDirectory();
        cacheFolder = [cacheDir stringByAppendingPathComponent:kAFNetworkingIncompleteDownloadFolderName];
        
        // Ensure all cache directories are there (needed only once)
        NSError *error = nil;
        if(![[NSFileManager new] createDirectoryAtPath:cacheFolder withIntermediateDirectories:YES attributes:nil error:&error]) {
            DLog(@"Failed to create cache directory at %@", cacheFolder);
        }
    });
    return cacheFolder;
}

- (NSString *)tempPath {
    NSString *tempPath = nil;
    if (self.targetPath) {
        NSString *md5URLString = [self.targetPath md5];
        tempPath = [[[self class] cacheFolder] stringByAppendingPathComponent:md5URLString];
    }
    return tempPath;
}

- (BOOL)deleteTempFileWithError:(NSError **)error {
    NSFileManager *fileManager = [NSFileManager new];
    BOOL success = YES;
    @synchronized(self) {
        NSString *tempPath = [self tempPath];
        if ([fileManager fileExistsAtPath:tempPath]) {
            success = [fileManager removeItemAtPath:[self tempPath] error:error];
        }
    }
    return success;
}

#pragma mark - AFURLRequestOperation

- (void)setCompletionBlockWithSuccess:(void (^)(RFFileDownloadOperation *operation, id responseObject))success
                              failure:(void (^)(RFFileDownloadOperation *operation, NSError *error))failure
{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-retain-cycles"
    self.completionBlock = ^ {
        NSError *localError = nil;
        if(self.isCancelled) {
            if (self.isDeletingTempFileOnCancel) {
                [self deleteTempFileWithError:&localError];
                if (localError) {
                    self.fileError = localError;
                }
            }
        }
        // Loss of network connections = error set, but not cancel
        else if (!self.error) {
            // Move file to final position and capture error
            @synchronized(self) {
                NSFileManager *fm = [NSFileManager new];
                if (self.shouldOverwriteOldFile && [fm fileExistsAtPath:self.targetPath]) {
                    [fm removeItemAtPath:self.targetPath error:&localError];
                    if (localError) {
                        DLog(@"Can`t remove exist file.");
                    }
                }
                if (localError) {
                    self.fileError = localError;
                }
                else {
                    [fm moveItemAtPath:[self tempPath] toPath:self.targetPath error:&localError];
                    if (localError) {
                        self.fileError = localError;
                    }
                }
            }
        }
        
        if (self.error) {
            if (failure) {
                dispatch_async(self.failureCallbackQueue ? self.failureCallbackQueue : dispatch_get_main_queue(), ^{
                    failure(self, self.error);
                });
            }
        } else {
            if (success) {
                dispatch_async(self.successCallbackQueue ? self.failureCallbackQueue : dispatch_get_main_queue(), ^{
                    success(self, self.targetPath);
                });
            }
        }
        
        [self deactiveStausRefreshTimer];
    };
#pragma clang diagnostic pop
}

- (NSError *)error {
    return self.fileError ? self.fileError : [super error];
}

// Avoid errors when resuming a fully downloaded file by accepte 416.
+ (NSIndexSet *)acceptableStatusCodes {
	NSMutableIndexSet *acceptableStatusCodes = [NSMutableIndexSet indexSetWithIndexesInRange:NSMakeRange(200, 100)];
	[acceptableStatusCodes addIndex:416];
	
	return acceptableStatusCodes;
}

#pragma mark - NSURLConnectionDelegate

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [super connection:connection didReceiveResponse:response];
    
    // Check if we have the correct response
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    if (![httpResponse isKindOfClass:[NSHTTPURLResponse class]]) {
        return;
    }
    
    // Check for valid response to resume the download if possible
    long long totalContentLength = self.response.expectedContentLength;
    long long fileOffset = 0;
    if(httpResponse.statusCode == 206) {
        NSString *contentRange = [httpResponse.allHeaderFields valueForKey:@"Content-Range"];
        if ([contentRange hasPrefix:@"bytes"]) {
            NSArray *bytes = [contentRange componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@" -/"]];
            if ([bytes count] == 4) {
                fileOffset = [bytes[1] longLongValue];
                totalContentLength = [bytes[2] longLongValue]; // If this is *, it's converted to 0
            }
        }
    }
    
    self.totalBytesReadPerDownload = 0;
    self.lastTotalBytesReadPerDownload = 0;
    self.offsetContentLength = fmaxl(fileOffset, 0);
    self.totalContentLength = totalContentLength;
    [self.outputStream setProperty:@(self.offsetContentLength) forKey:NSStreamFileCurrentOffsetKey];
}

- (long long)bytesDownloaded {
    return self.totalBytesReadPerDownload + self.offsetContentLength;
}

- (long long)bytesFileSize {
    return self.totalContentLength;
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data  {
    // Don't write to output stream if any error occurs
    if (![self hasAcceptableStatusCode] || ![self hasAcceptableContentType]) {
        return;
    }
    
    [super connection:connection didReceiveData:data];
    
    // Track custom bytes read because totalBytesRead persists between pause/resume.
    self.totalBytesReadPerDownload += [data length];

    if (self.progressiveDownloadProgressBlock) {
        self.progressiveDownloadProgressBlock(self);
    }
}

@end

//
//  WWDCStateManager.m
//  WWDC2014
//
//  by @iosxtools on Twitter on 14-5-31.
//  Copyright (c) http://www.iosxtools.com. All rights reserved.
//

#import "WWDCDownStateManager.h"
#import "WWDCDownState.h"
#import "RFDownloadManager.h"
#import "RFFileDownloadOperation.h"
#import "WWDCFileDownloadOperation.h"
#import "WWDCDownload.h"
@interface WWDCDownStateManager()<RFDownloadManagerDelegate>
@property(nonatomic,strong)RFDownloadManager *downloadManager;
@property(nonatomic,strong)NSMutableArray *requestDownItems;
@property(nonatomic,strong)NSMutableDictionary *requestDownItemsMap;
@end
@implementation WWDCDownStateManager
+ (WWDCDownStateManager*)sharedInstance
{
    static WWDCDownStateManager *instace = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        instace = [[self alloc] init];
        
    });
    return instace;
}
- (NSMutableDictionary*)downItemWithFileID:(NSInteger)fileID
{
    return self.requestDownItemsMap[@(fileID)];
    
}
- (void)addDownload:(NSDictionary*)downloadItem
{
    //WWDCFileDownloadOperation *op = [[WWDCFileDownloadOperation alloc]init];
    if([self.requestDownItems containsObject:downloadItem])
    {
        return;
    }
    
    [self.requestDownItems  addObject:downloadItem];
    
    NSInteger fileID = [downloadItem[@"fileID"] integerValue];
    
    self.requestDownItemsMap[@(fileID)]=downloadItem;
    
    NSString *urlString = downloadItem[@"url"];
    
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSString *targetPath = [AppPreference sharedPreference].downLoadPath;
    
   
    //[strongSelf.downloadManager addURL:url fileStorePath:targetPath];
    //[strongSelf.downloadManager startAll];
    
    WWDCFileDownloadOperation *fileDownloadOperation = [[WWDCFileDownloadOperation alloc]initWithRequest:request targetPath:targetPath shouldResume:YES shouldCoverOldFile:YES];
    
  
    fileDownloadOperation.fileID = fileID;
    
    [self.downloadManager addOperation:fileDownloadOperation];
    [self.downloadManager startAll];
    
}
- (void)addDownloads:(NSArray*)downloadItems
{
    for(NSDictionary *downloadItem in downloadItems)
    {
        [self addDownload:downloadItem];
    }
    [self.state downStart];
}
- (NSArray*)allSelectedDownloads
{
    return [self.requestDownItems copy];
}
#pragma RFDownloadManager Delegate
// download complete
- (void)RFDownloadManager:(RFDownloadManager *)downloadManager operationCompleted:(RFFileDownloadOperation *)operation;
{
    WWDCFileDownloadOperation *op = (WWDCFileDownloadOperation*)operation;
   
    NSInteger fileID = op.fileID;
   
    [self.state downCompleted:fileID];
   
}
// download failed
- (void)RFDownloadManager:(RFDownloadManager *)downloadManager operationFailed:(RFFileDownloadOperation *)operation;

{
    WWDCFileDownloadOperation *op = (WWDCFileDownloadOperation*)operation;
    NSInteger fileID = op.fileID;
    NSString *url = [op.request.URL absoluteString];
    DLog(@"download failed (%@) ",url);
    
    [self.state downFailed:fileID error:nil];
}
// update download progress indicator percent
- (void)RFDownloadManager:(RFDownloadManager *)downloadManager operationStateUpdate:(RFFileDownloadOperation *)operation;
{
   WWDCFileDownloadOperation *op = (WWDCFileDownloadOperation*)operation;
    
    NSInteger fileID = op.fileID;
    
    
   
    long long bytesFileSize = op.bytesFileSize;
    
    long long bytesDownloaded = op.bytesDownloaded;
    
    double percent = ((double)bytesDownloaded/(double)bytesFileSize *100);
    if(percent>100)
    {
        percent = 100.;
    }
    DLog(@"bytesDownloaded=%lld bytesFileSize=%lld p=%f",bytesDownloaded,bytesFileSize,percent);
    [self.state downPercentChanged:fileID percent:percent];
}



#pragma ivar init
- (WWDCDownState*)state{
    if(!_state) {
        _state = [[WWDCDownState alloc]init];
    }
    return _state;
}
- (RFDownloadManager*)downloadManager
{
    if(!_downloadManager)
    {
        _downloadManager = [RFDownloadManager sharedInstance];
        _downloadManager.delegate = self;
    }
    return _downloadManager;
}
- (NSMutableArray*)requestDownItems
{
    if(!_requestDownItems)
    {
        _requestDownItems = [NSMutableArray array];
    }
    return _requestDownItems;
}
- (NSMutableDictionary*)requestDownItemsMap
{
    if(!_requestDownItemsMap)
    {
        _requestDownItemsMap = [NSMutableDictionary dictionary];
    }
    return _requestDownItemsMap;
}
@end

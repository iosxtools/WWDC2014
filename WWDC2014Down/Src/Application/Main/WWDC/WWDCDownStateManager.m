//
//  WWDCStateManager.m
//  WWDC2014
//
//  by @iosxtools on Twitter on 14-5-31.
//  Copyright (c) http://www.iosxtools.com. All rights reserved.
//

#import "WWDCDownStateManager.h"
#import "WWDCDownState.h"
#import "WWDCDownload.h"
#import "TCBlobDownload.h"
#import "WWDCTCBlobDownloader.h"
@interface WWDCDownStateManager()<TCBlobDownloaderDelegate>
@property(nonatomic,strong)TCBlobDownloadManager *downloadManager;
@property(nonatomic,strong)NSMutableArray *requestDownItems;
@property(nonatomic,strong)NSMutableDictionary *requestDownItemsMap;
@property(nonatomic,assign)int refreshPercentCount;
@end
@implementation WWDCDownStateManager
+ (WWDCDownStateManager*)sharedInstance
{
    static WWDCDownStateManager *instace = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        instace = [[self alloc] init];
        
        [[TCBlobDownloadManager sharedInstance] setMaxConcurrentDownloads:5];
        
    });
    return instace;
}
- (NSMutableDictionary*)downItemWithFileID:(NSInteger)fileID
{
    return self.requestDownItemsMap[@(fileID)];
    
}


- (void)addDownload:(NSDictionary*)downloadItem
{
    
    if([self.requestDownItems containsObject:downloadItem])
    {
        return;
    }
    
    [self.requestDownItems  addObject:downloadItem];
    
    NSInteger fileID = [downloadItem[@"fileID"] integerValue];
    
    self.requestDownItemsMap[@(fileID)]=downloadItem;
    
    
    
}

- (void)start
{
    for(NSDictionary *downloadItem in self.requestDownItems){
        WWDCTCBlobDownloader *downloader = [self tcBlobDownloader:downloadItem];
        [[TCBlobDownloadManager sharedInstance] startDownload:downloader];
    }
    
    [[TCBlobDownloadManager sharedInstance]start];
    
    
    
    
}
- (void)stop
{
    [[TCBlobDownloadManager sharedInstance]pause];
}

- (WWDCTCBlobDownloader*)tcBlobDownloader:(NSDictionary*)downloadItem
{
    NSString *urlString = downloadItem[@"url"];
    
    NSInteger fileID = [downloadItem[@"fileID"] integerValue];
    
    
    NSString *encodedText = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString:encodedText];
    
    
    NSString *targetPath = [AppPreference sharedPreference].downLoadPath;
    
    
    WWDCTCBlobDownloader *download = [[WWDCTCBlobDownloader alloc] initWithURL:url  downloadPath:targetPath
                                                                      delegate:self];
    download.fileID = fileID;
    
    return download;

}
#pragma TCBlobDownloadManager delegate

- (void)download:(TCBlobDownloader *)blobDownload didFinishWithSuccess:(BOOL)downloadFinished atPath:(NSString *)pathToFile
{
    WWDCTCBlobDownloader *download = (WWDCTCBlobDownloader*)blobDownload;
    
    NSInteger fileID = download.fileID;
    
    [self.state downCompleted:fileID];

}

- (void)download:(TCBlobDownloader *)blobDownload
  didReceiveData:(uint64_t)receivedLength
         onTotal:(uint64_t)totalLength
        progress:(float)progress
{
   WWDCTCBlobDownloader *download = (WWDCTCBlobDownloader*)blobDownload;
    
    NSInteger fileID = download.fileID;
    
    double percent = ((double)receivedLength/(double)totalLength *100);
    
    if(percent>100)
    {
        percent = 100.;
        
        [self.state downPercentChanged:fileID percent:percent];
        return;
    }
    
    
    self.refreshPercentCount++;
    if(self.refreshPercentCount>=5){
        self.refreshPercentCount = 0;
        [self.state downPercentChanged:fileID percent:percent];
    }
    
    //DLog(@"")
    DLog(@"fileID =%ld bytesDownloaded=%lld bytesFileSize=%lld p=%f",fileID,receivedLength,totalLength,percent);
   

    
}

- (void)download:(TCBlobDownloader *)blobDownload didReceiveFirstResponse:(NSURLResponse *)response
{
   WWDCTCBlobDownloader *download = (WWDCTCBlobDownloader*)blobDownload;
    
    NSInteger fileID = download.fileID;
    
    NSLog(@"begin download file id=%ld",fileID);
}

- (void)download:(TCBlobDownloader *)blobDownload didStopWithError:(NSError *)error
{
    WWDCTCBlobDownloader *download = (WWDCTCBlobDownloader*)blobDownload;
    
    NSInteger fileID = download.fileID;
    
    NSLog(@"download stop file id=%ld error=%@",fileID,error);
}

- (void)cancellAllDownload
{
    [self.downloadManager cancelAllDownloadsAndRemoveFiles:NO];
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

#pragma ivar init
- (WWDCDownState*)state{
    if(!_state) {
        _state = [[WWDCDownState alloc]init];
    }
    return _state;
}

- (TCBlobDownloadManager*)downloadManager
{
    if(!_downloadManager)
    {
        _downloadManager = [TCBlobDownloadManager sharedInstance];
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

//
//  WWDCDownStateManager.h
//  WWDC2014
//
//  by @iosxtools on Twitter on 14-5-31.
//  Copyright (c) http://www.iosxtools.com. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WWDCDownState,WWDCDownload;
@interface WWDCDownStateManager : NSObject
@property(nonatomic,strong)WWDCDownState *state;
+ (WWDCDownStateManager*)sharedInstance;
- (void)addDownload:(NSDictionary*)downloadItem;
- (void)addDownloads:(NSArray*)downloadItems;
- (NSArray*)allSelectedDownloads;
- (NSMutableDictionary*)downItemWithFileID:(NSInteger)fileID;
- (void)cancellAllDownload;
- (void)start;
- (void)stop;
@end

//
//  WWDCDownState.h
//  WWDC2014
//
//  by @iosxtools on Twitter on 14-5-31.
//  Copyright (c) http://www.iosxtools.com. All rights reserved.
//

#import <XXXOSXCommon/XXXOSXCommon.h>

@interface WWDCDownState : XXXMutiDelegateModule
- (void)downStart;
- (void)downCompleted:(NSInteger)fileID;
- (void)downFailed:(NSInteger)fileID error:(NSError*)error;
- (void)downPercentChanged:(NSInteger)fileID percent:(double)percent;
@end


@protocol WWDCDownStateDelegate
@optional
- (void)downStart:(WWDCDownState *)sender;
- (void)downCompleted:(WWDCDownState *)sender fileID:(NSInteger)fileID;
- (void)downFailed:(WWDCDownState *)sender fileID:(NSInteger)fileID error:(NSError*)error;
- (void)downPercentChanged:(WWDCDownState *)sender fileID:(NSInteger)fileID percent:(double)percent;
@end
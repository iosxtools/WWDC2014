//
//  WWDCDownState.m
//  WWDC2014
//
//  by @iosxtools on Twitter on 14-5-31.
//  Copyright (c) http://www.iosxtools.com. All rights reserved.
//

#import "WWDCDownState.h"

@implementation WWDCDownState
- (void)downStart
{
    [multicastDelegate downStart:self];

}
- (void)downCompleted:(NSInteger)fileID;
{
    [multicastDelegate downCompleted:self fileID:fileID ];
}
- (void)downFailed:(NSInteger)fileID error:(NSError*)error;
{
    [multicastDelegate downFailed:self fileID:fileID error:error];
}
- (void)downPercentChanged:(NSInteger)fileID percent:(double)percent;
{
    [multicastDelegate downPercentChanged:self fileID:fileID percent:percent];
}
@end

//
//  NSObject+RunBlockInMainThread.h
//  XXXARC
//
//  Created by @iosxtools on Twitter on on 7/29/13.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^executeBlock)(void);
@interface NSObject (RunBlockInMainThread)
- (void)runOnMainQueueWithoutDeadlocking:(executeBlock)block;
- (void)runOnMainThreadAfter:(double)delayInSeconds block:(executeBlock)block;
@end

//
//  RemoteDeviceManager.h
//  XXXARC
//
//  Created by @iosxtools on Twitter 11/3/13.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#import <Foundation/Foundation.h>
@class RemoteClientDevice;
@interface RemoteDeviceManager : NSObject
+ (RemoteDeviceManager*)sharedInstance;
- (void)saveDeviceApp:(RemoteClientDevice*)deviceApp;
- (RemoteClientDevice*)deviceForHostBaseURL:(NSString*)urlString;
@end

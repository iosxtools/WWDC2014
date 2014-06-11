//
//  XXXOSXSystem.h
//  XXXOSXCommon
//
//  Created by iDevFans on 14-5-24.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XXXOSXSystem : NSObject
+ (XXXOSXSystem*)sharedInstance;
- (NSString *)UUID;
- (NSString *)serialNumber;
- (NSString *)osVersion;
- (NSString *)appcurrentVersion;
- (NSString*)ipAddr;
@end

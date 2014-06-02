//
//  XXXCommonImageCache.h
//  XXXOSXCommon
//
//  Created by iDevFans on 14-5-24.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XXXCommonImageCache : NSObject
+ (XXXCommonImageCache*)sharedInstance;
- (NSImage*)keyImage;
- (NSImage*)columnImage;

//window
- (NSImage*)windowTitleImage;
- (void)upDateWindowTitleImage:(id)image;

//device
- (NSImage*)deviceIPhoneImage;
- (NSImage*)deviceIMacImage;
- (NSImage*)deviceIPadImage;
- (NSImage*)deviceMacbookImage;
- (NSImage*)deviceMacbookAirImage;
- (NSImage*)deviceMacbookProImage;
@end

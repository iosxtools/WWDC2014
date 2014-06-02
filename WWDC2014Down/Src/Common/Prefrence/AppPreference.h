//
//  AppPreference.h
//  WWDC2014Down
//
//  by @iosxtools on Twitter on 14-5-24.
//  Copyright (c) 2014 http://www.iosxtools.com All rights reserved.
//

#import <XXXOSXCommon/XXXOSXCommon.h>

@interface AppPreference : XXXPreference
+ (AppPreference *)sharedPreference;
@property (nonatomic, strong) NSString    *downLoadPath;
@end

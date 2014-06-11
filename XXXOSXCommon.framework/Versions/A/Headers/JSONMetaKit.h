//
//  JSONMetaKit.h
//  XXXV2
//
//  by @iosxtools on Twitter on 14-2-21.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSONMetaKit : NSObject
+ (JSONMetaKit*)sharedInstance;
- (id)parseJSONStringMeta:(NSString*)jsonStr;
@end

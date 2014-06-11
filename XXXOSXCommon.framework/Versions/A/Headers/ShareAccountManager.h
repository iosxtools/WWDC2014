//
//  ShareAccountManager.h
//  SQL+
//
//  by @iosxtools on Twitter on 14-2-14.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#import <Foundation/Foundation.h>

#define kShareIconKey              @"icon"
#define kShareNameKey              @"name"

@class ACAccount;
@interface ShareAccountManager : NSObject
+ (ShareAccountManager*)sharedInstance;
- (NSArray*)fackBookAccouts;
- (NSArray*)twitterAccouts;
- (NSArray*)sinaWeiboAccouts;
- (NSArray*)tencentWeiboAccouts;
- (NSArray*)accountWithIdentifier:(NSString *)identifier;
- (NSArray*)accountIdentifiers;
- (NSArray*)accountInfoItems;
- (NSDictionary*)accountInfoItemWithIdentifier:(NSString *)identifier;
- (BOOL)hasFackBookAccout;
- (BOOL)hasTwitterAccout;
- (BOOL)hasWeiboAccout;
- (BOOL)hasTencentWeiboAccout;
@end

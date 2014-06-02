//
//  RouteManager.h
//  iOSXHelperDemo
//
//  Created by @iosxtools on Twitter on on 4/20/13.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^RouterCallback)(NSDictionary *params);
@interface RouteManager : NSObject
+ (instancetype)sharedInstance;
- (void)map:(NSString*)format toViewController:(Class)viewController;
- (void)map:(NSString *)format toViewController:(Class)viewController toCallback:(RouterCallback)callback;
- (NSViewController*)open:(NSString*)url;
- (NSViewController*)open:(NSString*)url  withParams:(NSDictionary*)params;
- (NSArray*)viewControllers;
@end

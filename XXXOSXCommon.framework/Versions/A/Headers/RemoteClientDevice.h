//
//  RemoteClientDevice.h
//  XXXOSXCommon
//
//  Created by @iosxtools on Twitter 11/28/13.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RemoteClientDevice : NSObject
@property (nonatomic, strong) NSString *UUID;
@property (nonatomic, strong) NSString *hostName;
@property (nonatomic, assign) NSInteger port;
@property (nonatomic, strong) NSString *baseURLString;
/*init property member var by parsing NSDictionary parameter*/
- (id)initWithDictionary:(NSDictionary *)dictionary;
@end

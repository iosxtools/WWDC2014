//
//  HTTPClient.h
//  iOSXHttpClient
//
//  Created by @iosxtools on Twitter on on 5/22/13.
//  Copyright (c) 2013 Suning. All rights reserved.
//

#import "HTTPRequestOperation.h"
@interface HTTPClient : AFHTTPClient
- (id)initWithBaseStringURL:(NSString *)url;
- (id)initWithBaseNSURL:(NSURL *)url;
- (HTTPRequestOperation *)executeQuery:(HTTPQuery *)query completionBlock:(void (^)(HTTPRequestOperation *, id, NSError *))block;
- (AFHTTPRequestOperation *)executeImageQuery:(HTTPQuery *)query completionBlock:(void (^)(AFHTTPRequestOperation *, id, NSError *))block;
@end

//
//  HTTPServer.h
//  XXXTest
//
//  Created by @iosxtools on Twitter on on 6/18/13.
//
//

#import <Foundation/Foundation.h>

@interface HTTPRestServer : NSObject
+ (void)GET:(NSString *)path parameters:(NSDictionary *)params
 completion:(void (^)(id JSON, NSError *error))finished;

+ (void)POST:(NSString *)path parameters:(NSDictionary *)params
  completion:(void (^)(id JSON, NSError *error))finished;

// this one is here for performing some custom requests, e.g. TWRequest
+ (void)performRequest:(NSURLRequest *)request
            completion:(void (^)(id JSON, NSError *error))finished;
@end

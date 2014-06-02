//
//  SNCHTTPRequest.h
//  Helens
//
//  Created by @iosxtools on Twitter on on 10/15/12.
//  Copyright (c) 2012 Helens. All rights reserved.
//


#import <Foundation/Foundation.h>

#define kJSONParseExceptionCode         @"network.data.json.exception"
#define kXMLParseExceptionCode          @"network.data.xml.exception"

#define kImageUploadCapacityLimited     @"2005"
#define kImageUploadResponseSuccess     @"200"

typedef void (^StringHttpBlock)(NSString *);
typedef void (^JSONHttpBlock)(NSDictionary *);


typedef void (^FailedHttpBlock)(NSString *, NSString *);

typedef enum {
    
    NormalResponseState = 0,
    
    GeneralExceptionState,
    
    SessionTimeoutState,
    
    JSONParseExceptionState
    
} ServerResponseState;

@interface HTTPRequest : NSObject

// JSON格式
+ (ASIHTTPRequest *)sendJSONRequestWithURL:(NSString *)urlString andPostData:(id)postData failedBlock:(FailedHttpBlock)failed completionBlock:(JSONHttpBlock)completion;
+ (ASIHTTPRequest *)sendJSONRequestWithURL:(NSString *)urlString failedBlock:(FailedHttpBlock)failed completionBlock:(JSONHttpBlock)completion;



// 文件上传
+ (ASIFormDataRequest *)fileUploadRequestWithURL:(NSString *)urlString andPostData:(id)postData failedBlock:(FailedHttpBlock)failed completionBlock:(StringHttpBlock)completion;


@end

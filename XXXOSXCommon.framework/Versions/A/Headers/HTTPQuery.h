//
//  HTTPQuery.h
//  iOSXHttpClient
//
//  Created by @iosxtools on Twitter on on 5/22/13.
//  Copyright (c) 2013 Suning. All rights reserved.
//
#import <Foundation/Foundation.h>
/**
 HTTP methods for requests
 */
typedef enum  HTTPQueryMethod{
    HTTPGET,
    HTTPPOST,
    HTTPPUT,
    HTTPDELETE
} HTTPQueryMethod;
typedef id (^HTTPQueryTransformBlock)(id obj);
@interface HTTPQuery : NSObject
@property(nonatomic,assign)HTTPQueryMethod method;
@property(nonatomic,copy)NSString *path;
@property(nonatomic,retain)NSDictionary *parameters;
@property(nonatomic,retain,readonly)NSArray *multiparts;
@property(nonatomic,copy)HTTPQueryTransformBlock transformBlock;
+ (instancetype)queryWithMethod:(HTTPQueryMethod)method path:(NSString *)path modelClass:(Class)modelClass;
+ (instancetype)queryWithMethod:(HTTPQueryMethod)method path:(NSString *)path parameters:(NSDictionary *)parameters;
+ (instancetype)queryWithMethod:(HTTPQueryMethod)method path:(NSString *)path parameters:(NSDictionary *)parameters modelClass:(Class)modelClass;
+ (instancetype)queryWithMethod:(HTTPQueryMethod)method path:(NSString *)path parameters:(NSDictionary *)parameters modelClass:(Class)modelClass objectKeyPath:(NSString *)keyPath;
- (id)initWithMethod:(HTTPQueryMethod)method path:(NSString *)path parameters:(NSDictionary *)parameters;
- (void)addFileData:(NSData *)data withName:(NSString *)name type:(NSString *)mimeType filename:(NSString *)filename;
- (void)addFileData:(NSDictionary *)data;
@end

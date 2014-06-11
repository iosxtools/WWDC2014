//
//  XXXPreference.h
//  XXXARC
//
//  Created by @iosxtools on Twitter 10/4/13.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#import <Foundation/Foundation.h>
@interface XXXPreference : NSObject
@property(nonatomic,strong)NSMutableDictionary * proTypeEncodingCache;
@property (nonatomic,strong)NSMutableArray         *classes;
@property (nonatomic,strong)NSDictionary         *defaultsKVData;
@property (nonatomic,strong)NSUserDefaults  *defaults;
- (void)registerFromPlistFile:(NSString *)plistFile;
- (void)registerFromDictionary:(NSDictionary *)data;
- (void)registerObjectType:(Class)class;
- (void)getPropertiesTypeEncoding;
- (NSDictionary*)registerDefault;
- (NSDictionary*)defaultKVDataConfig;
- (void)removeObjectForKey:(NSString *)defaultName;
- (void)removeAllUserObjectKey;
@end

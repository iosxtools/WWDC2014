//
//  NSObject+propertyType.h
//  XXXARC
//
//  Created by @iosxtools on Twitter on on 7/22/13.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
@interface NSObject (propertyType)
- (NSArray*)properties;
- (BOOL)isBoolProperty:(NSString*)name;
- (BOOL)isDateProperty:(NSString*)name;
- (BOOL)isStringProperty:(NSString*)name;
- (BOOL)iNumberProperty:(NSString*)name;
- (NSString*)propertyTypeName:(NSString*)name;

+ (BOOL)isSimpleType:(NSString *)type;
+ (BOOL)isObjectType:(NSString *)type;
+ (NSString*)objectType:(NSString *)type;
@end

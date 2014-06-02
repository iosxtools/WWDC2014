//
//  HTTPParser.h
//  XXXARC
//
//  Created by @iosxtools on Twitter on on 7/3/13.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#import <Foundation/Foundation.h>
typedef id (^HTTPTransformBlock)(id obj);
@interface HTTPParser : NSObject
+ (HTTPTransformBlock)transformBlockWithModelClass:(Class)modelClass objectKeyPath:(NSString *)keyPath;
+ (HTTPTransformBlock)transformBlockWithModelClass:(Class)modelClass;
@end

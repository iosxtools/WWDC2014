// NSDictionary+KeyPath.h
//  iOSXHttpClient
//
//  Created by @iosxtools on Twitter on on 5/22/13.
//  Copyright (c) 2013 Suning. All rights reserved.
//
#import <Foundation/Foundation.h>
@interface NSDictionary (KeyPath)
//query object by keyPath
- (id)objectForKeyPath:(NSString *)keyPath;
@end

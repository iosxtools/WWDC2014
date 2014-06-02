//
//  JSONModelConverter.h
//  iOSXHttpClient
//
//  Created by @iosxtools on Twitter on on 5/23/13.
//  Copyright (c) 2013 Suning. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface JSONModelConverter : NSObject
+ (NSDictionary*)toJSON:(id)object;
+ (id)toClass:(id)prototypeClass from:(NSDictionary*)dictionary;
@end

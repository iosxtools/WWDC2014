//
//  RKValueTransformers.h
//  RestKit
//
//  Created by Blake Watters on 11/26/12.
//  Copyright (c) 2012 RestKit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModelValueTransformer.h"
#import "JSONModelConverter.h"
@interface NSValueTransformer(JSONModel)
+ (NSValueTransformer *)JSONDictionaryTransformerWithModelClass:(Class)modelClass ;
+ (NSValueTransformer *)JSONArrayTransformerWithModelClass:(Class)modelClass;
@end

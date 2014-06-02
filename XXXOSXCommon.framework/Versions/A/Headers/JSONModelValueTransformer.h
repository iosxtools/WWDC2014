//
//  JSONModelValueTransformer.h
//  iOSXHttpClient
//
//  Created by @iosxtools on Twitter on on 5/23/13.
//  Copyright (c) 2013 Suning. All rights reserved.
//

typedef id (^JSONModelValueTransformerBlock)(id);

//
// A value transformer supporting block-based transformation.
//
@interface JSONModelValueTransformer : NSValueTransformer

// Returns a transformer which transforms values using the given block. Reverse
// transformations will not be allowed.
+ (instancetype)transformerWithBlock:(JSONModelValueTransformerBlock)transformationBlock;

// Returns a transformer which transforms values using the given block, for
// forward or reverse transformations.
+ (instancetype)reversibleTransformerWithBlock:(JSONModelValueTransformerBlock)transformationBlock;

// Returns a transformer which transforms values using the given blocks.
+ (instancetype)reversibleTransformerWithForwardBlock:(JSONModelValueTransformerBlock)forwardBlock reverseBlock:(JSONModelValueTransformerBlock)reverseBlock;


@end

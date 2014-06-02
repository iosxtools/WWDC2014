//
//  HTTPRequestOperation.h
//  iOSXHttpClient
//
//  Created by @iosxtools on Twitter on on 5/22/13.
//  Copyright (c) 2013 Suning. All rights reserved.
//


#import "HTTPQuery.h"
@interface HTTPRequestOperation : AFJSONRequestOperation
// Transform Logic Define Implement the response into a model object or an array of model objects.
@property (copy, nonatomic) HTTPQueryTransformBlock transformBlock;
//a model object or an array of model objects or json dictiobary object.
@property (strong, nonatomic, readonly) id responseObject;
// Init the request with the specified url request and transform block.
- (id)initWithRequest:(NSURLRequest *)urlRequest transformBlock:(HTTPQueryTransformBlock)transformBlock;
@end

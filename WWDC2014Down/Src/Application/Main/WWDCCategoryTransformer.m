//
//  WWDCCategoryTransformer.m
//  WWDC2014
//
//  Created by @iosxtools on Twitter on 14-5-29.
//  Copyright (c) 2014 http://www.iosxtools.com All rights reserved.
//

#import "WWDCCategoryTransformer.h"
#import "Track.h"

NSString * const WWDCCategoryTransformerName = @"WWDCCategoryTransformerName";

static NSDictionary * CateTreeNodeFromModelObject(NSArray *models) {
    NSMutableArray *nodes = [NSMutableArray array];
    for(Track *category in models){
        NSMutableDictionary *nodeMap = [NSMutableDictionary dictionary];
        nodeMap[@"name"]=category.name;
        nodeMap[@"icon"]=[NSImage imageNamed:@"wwdcIcon29x29"];
        [nodes addObject:nodeMap];
    }
    return [nodes copy];
}
@implementation WWDCCategoryTransformer
+ (void)load {
    @autoreleasepool {
        [NSValueTransformer registerValueTransformerWithName:WWDCCategoryTransformerName transformedValueClass:[NSDate class] returningTransformedValueWithBlock:^id(id value){
            return CateTreeNodeFromModelObject(value);
        }];
    }
}
@end

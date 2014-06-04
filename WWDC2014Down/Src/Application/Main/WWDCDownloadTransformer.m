//
//  WWDCDownloadTransformer.m
//  WWDC2014
//
//  by @iosxtools on Twitter on 14-5-30.
//  Copyright (c) http://www.iosxtools.com. All rights reserved.
//

#import "WWDCDownloadTransformer.h"
#import "WWDCDownload.h"
#import "WWDC.h"
#import "WWDCBO.h"
#import "WWDC+URL.h"

NSString * const WWDCDownloadTransformerName = @"WWDCDownloadTransformerName";

static NSString* vedioDisplayType(NSInteger type)
{
    XXXAssert(type<=2);
    NSArray *types = @[@"HD",@"SD",@"PDF"];
    return types[type];
}

static NSArray * tableItemNodeFromModelObject(NSArray *models) {
    NSMutableArray *nodes = [NSMutableArray array];
    for(WWDCDownload *download in models){
        NSMutableDictionary *nodeMap = [NSMutableDictionary dictionary];
        NSInteger WWDCID = download.wwdcID;
        WWDC *wwdc= [[WWDCBO sharedInstance]wwdcWithID:WWDCID];
        nodeMap[@"fileID"] = @(download.ID);
        NSString *url = [wwdc urlWithType:download.type];
        if(url.length<=1)
        {
            continue;
        }
        nodeMap[@"url"] = url;
        nodeMap[@"isSelected"]=@(1);
        nodeMap[@"percent"]=[NSNumber numberWithDouble:0];
        nodeMap[@"title"]=wwdc.title;
        nodeMap[@"type"]=vedioDisplayType(download.type);
        nodeMap[@"status"] = @"";
        //nodeMap[@"name"]=category.name;
        //nodeMap[@"icon"]=[NSImage imageNamed:@"wwdcIcon29x29"];
        [nodes addObject:nodeMap];
    }
    return [nodes copy];
}


@implementation WWDCDownloadTransformer
+ (void)load {
    @autoreleasepool {
        [NSValueTransformer registerValueTransformerWithName:WWDCDownloadTransformerName transformedValueClass:[NSDate class] returningTransformedValueWithBlock:^id(id value){
            return tableItemNodeFromModelObject(value);
        }];
    }
}

@end

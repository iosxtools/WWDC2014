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
#import "WWDC+Download_Selection.h"

NSString * const WWDCDownloadTransformerName = @"WWDCDownloadTransformerName";

static NSString* vedioDisplayType(NSInteger type)
{
    XXXAssert(type<=2);
    NSArray *types = @[@"HD",@"SD",@"PDF"];
    return types[type];
}

static NSArray * downloadNodeMapWithWWDC(WWDC* wwdc)
{
    
    if(![wwdc downSelected])
    {
        return nil;
    }
    NSMutableArray *downloads =  [NSMutableArray array];
    
    if(wwdc.isSelectedHD){
        WWDCDownload *download= [[WWDCBO sharedInstance]wwdcDownloadWithWWDCID:wwdc.ID type:WWDCVedioHDType];
        [downloads addObject:download];
    }
    
    if(wwdc.isSelectedSD){
        WWDCDownload *download= [[WWDCBO sharedInstance]wwdcDownloadWithWWDCID:wwdc.ID type:WWDCVedioSDType];
        [downloads addObject:download];
    }
    
    if(wwdc.isSelectedPDF){
        WWDCDownload *download= [[WWDCBO sharedInstance]wwdcDownloadWithWWDCID:wwdc.ID type:WWDCVedioPDFType];
        if(download){
            [downloads addObject:download];
        }
        else{
            DLog(@"link noe exist ! ID %ld title %@ ",wwdc.ID,wwdc.title);
        }
    }
    
    if([downloads count]<=0){
        return nil;
    }

    NSMutableArray *downloadItems =  [NSMutableArray array];
    for(WWDCDownload *download in downloads)
    {
        NSMutableDictionary *nodeMap = [NSMutableDictionary dictionary];
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
        
        [downloadItems addObject:nodeMap];
    }
    
    return downloadItems;
}

static NSArray * tableItemNodeFromWWDCModelObject(NSArray *models) {
    NSMutableArray *nodes = [NSMutableArray array];
    for(WWDC *wwdc in models){
        
        NSInteger WWDCID = wwdc.ID;
        WWDCDownload *download;
        if(wwdc.isSelectedHD){
             download= [[WWDCBO sharedInstance]wwdcDownloadWithWWDCID:WWDCID type:WWDCVedioHDType];
        }
        
        NSString *url = [wwdc urlWithType:download.type];
        if(url.length<=1)
        {
            continue;
        }
        NSArray *nodeMaps =downloadNodeMapWithWWDC(wwdc);
        if([nodeMaps count]>0){
            [nodes addObjectsFromArray:nodeMaps];
        }
    }
    return [nodes copy];
}


static NSArray * tableItemNodeFromDownloadModelObject(NSArray *models) {
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
            return tableItemNodeFromWWDCModelObject(value);
        }];
    }
}

@end

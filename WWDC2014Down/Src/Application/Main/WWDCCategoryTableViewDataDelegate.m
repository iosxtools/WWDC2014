/*
WWDCCategoryTableViewDataDelegate.m
APPProbe
Created by @iosxtools on Twitter on 28/05/2014 10:00PM.
Copyright (c) http://www.iosxtools.com  All rights reserved.
*/

#import "WWDCCategoryTableViewDataDelegate.h"
#import "WWDCBO.h"
@implementation WWDCCategoryTableViewDataDelegate

- (void)addData:(id)data;
{
    assert(data);
   [super addData:data];
    
}

- (void)setData:(id)data{
    assert(data);
    NSArray *catesNodes = [[WWDCBO sharedInstance]categoryTreeNodes:data];
    [super setData:catesNodes];
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    // Used by bindings on the NSTableCellView's objectValue
    NSDictionary *item = [self.items objectAtIndex:row];
    return item;
}

@end

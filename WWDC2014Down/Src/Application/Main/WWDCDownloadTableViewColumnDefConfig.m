/*
WWDCDownloadTableViewColumnDefConfig.m
APPProbe
Created by @iosxtools on Twitter on 30/05/2014 04:20AM.
Copyright (c) http://www.iosxtools.com  All rights reserved.
*/

#import "WWDCDownloadTableViewColumnDefConfig.h"

@implementation WWDCDownloadTableViewColumnDefConfig
+ (NSArray*)defConfig;
{
    XXXNSTableColumnField *col0 = [[XXXNSTableColumnField alloc]init];
    col0.title      = @"Column ID";
    col0.identifier = @"colID";
    col0.width      = 100;
    col0.minWidth   = 100;
    col0.editable   = 1;
    col0.headerAlignment = NSCenterTextAlignment;
    col0.dataAlignment = NSCenterTextAlignment;
    col0.cellType = DBCellTypeTextField;
    
    XXXNSTableColumnField *col1 = [[XXXNSTableColumnField alloc]init];
    col1.title      = @"Name";
    col1.identifier = @"name";
    col1.width      = 100;
    col1.minWidth   = 100;
    col1.editable   = 0;
    col1.headerAlignment = NSCenterTextAlignment;
    col1.dataAlignment = NSCenterTextAlignment;
    col1.cellType = DBCellTypeTextField;
    

    return @[       
             col0,
                    
             col1,
                 ];
}


@end

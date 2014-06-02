/*
 WWDCDownloadDAO.m
 project
 Created by author on 31/05/2014 10:15AM.
 Copyright (c) 2014 author. All rights reserved.
 */
#import "WWDCDownloadDAO.h"
@implementation WWDCDownloadDAO
- (id)init{
    self = [super init];
    if (self) {
        self.tableName = @"WWDCDownload";
        self.fldList   = [[NSArray alloc]initWithObjects:@"ID",@"wwdcID",@"type",@"status",nil];
        self.keyList   = [[NSArray alloc]initWithObjects:@"ID",nil];
        NSMutableSet *allFieldSet = [[NSMutableSet alloc]initWithArray:self.fldList];
        NSSet *keyFieldSet = [[NSSet alloc]initWithArray:self.keyList];
        [allFieldSet minusSet:keyFieldSet];
        self.fldExcludeKeyList = [allFieldSet allObjects];
    }
	return self;
}
@end


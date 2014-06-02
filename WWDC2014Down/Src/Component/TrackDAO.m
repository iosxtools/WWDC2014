/*
 TrackDAO.m
 project
 Created by author on 29/05/2014 02:24AM.
 Copyright (c) 2014 author. All rights reserved.
 */
#import "TrackDAO.h"
@implementation TrackDAO
- (id)init{
    self = [super init];
    if (self) {
        self.tableName = @"Track";
        self.fldList   = [[NSArray alloc]initWithObjects:@"ID",@"name",@"sortOrder",nil];
        self.keyList   = [[NSArray alloc]initWithObjects:@"ID",nil];
        NSMutableSet *allFieldSet = [[NSMutableSet alloc]initWithArray:self.fldList];
        NSSet *keyFieldSet = [[NSSet alloc]initWithArray:self.keyList];
        [allFieldSet minusSet:keyFieldSet];
        self.fldExcludeKeyList = [allFieldSet allObjects];
    }
	return self;
}
@end


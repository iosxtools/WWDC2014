/*
 WWDCDAO.m
 project
 Created by author on 28/05/2014 10:57PM.
 Copyright (c) 2014 author. All rights reserved.
 */
#import "WWDCDAO.h"
@implementation WWDCDAO
- (id)init{
    self = [super init];
    if (self) {
        self.tableName = @"WWDC";
        self.fldList   = [[NSArray alloc]initWithObjects:@"ID",@"wwdcYear",@"title",@"category",@"platform",@"hdLink",@"sdLink",@"pdfLink",@"desc",@"sortOrder",nil];
        self.keyList   = [[NSArray alloc]initWithObjects:@"ID",nil];
        NSMutableSet *allFieldSet = [[NSMutableSet alloc]initWithArray:self.fldList];
        NSSet *keyFieldSet = [[NSSet alloc]initWithArray:self.keyList];
        [allFieldSet minusSet:keyFieldSet];
        self.fldExcludeKeyList = [allFieldSet allObjects];
    }
	return self;
}
@end


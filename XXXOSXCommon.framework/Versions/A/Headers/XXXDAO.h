//
//  XXXDAO.h
//  XXXV1
//
//  Created by @iosxtools on Twitter 11/20/13.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

@interface  XXXDAO : NSObject
/*return record total number*/
- (NSInteger)rowNumbers;
/*return sum of field*/
- (NSInteger)sumOf:(NSString*)fieldName;
/*return record total number*/
- (NSInteger)pageNumberWithSize:(NSInteger)pageSize;
/*insert a record*/
- (BOOL)insert:(id)model;
/*update a record*/
- (BOOL)update:(id)model;
/*delete a record*/
- (BOOL)delete:(id)model;
/*execute  sql update in table*/
- (BOOL)sqlUpdate:(NSString*)sql;
/*execute  sql update in table*/
- (BOOL)sqlUpdate:(NSString*)sql withArgumentsInArray:(NSArray*)args;
/*execute  sql update in table*/
- (BOOL)sqlUpdate:(NSString*)sql withParameterDictionary:(NSDictionary*)dics;
/*execute  sql query in table*/
- (NSArray*)sqlQuery:(NSString*)sql;
/*execute  sql query in table*/
- (NSArray*)sqlQuery:(NSString*)sql  withArgumentsInArray:(NSArray*)args;
/*execute  sql query in table*/
- (NSArray*)sqlQuery:(NSString*)sql  withParameterDictionary:(NSDictionary*)dics;
/*delete all record*/
- (BOOL)clearAll;
/*fetch all record*/
- (NSArray*)findAll;
/*fetch record By Primary Key Field*/
- (id)findByKey:(id)key;
/*fetch MAX(column) By Primary Key Field*/
- (id)findMaxKey;
/*fetch records for given attributes*/
- (NSArray*)findByAttributes:(NSDictionary*)Attributes;
/*fetch records based on the index of pages*/
- (NSArray*)findByPage:(NSInteger)index pageSize:(NSInteger)pageSize;
@end

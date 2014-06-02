/*
 Track.h
 project
 Created by author on 29/05/2014 02:24AM.
 Copyright (c) 2014 author. All rights reserved.
 */
@interface Track : XXXDataModel
@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) NSInteger sortOrder;
/*init property member var by parsing NSDictionary parameter*/
- (id)initWithDictionary:(NSDictionary *)dictionary;
/*save new model object*/
- (BOOL)save;
/*save updated model object*/
- (BOOL)update;
/*delete current model object*/
- (BOOL)delete;
@end
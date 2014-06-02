/*
 WWDCDownload.h
 project
 Created by author on 31/05/2014 10:15AM.
 Copyright (c) 2014 author. All rights reserved.
 */
@interface WWDCDownload : XXXDataModel
@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, assign) NSInteger wwdcID;
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, assign) NSInteger status;
/*init property member var by parsing NSDictionary parameter*/
- (id)initWithDictionary:(NSDictionary *)dictionary;
/*save new model object*/
- (BOOL)save;
/*save updated model object*/
- (BOOL)update;
/*delete current model object*/
- (BOOL)delete;
@end
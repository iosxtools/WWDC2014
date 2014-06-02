/*
 XXXTabItemDefine.h
 test
 Created by meme on 31/08/2013 09:33PM.
 Copyright (c) 2013 meme. All rights reserved.
 */
@interface XXXTabItemDefine : DataModel
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, strong) NSString *controllerName;
@property (nonatomic, strong) NSString *imageName;
@property (nonatomic, strong) NSString *toolTip;
@property (nonatomic, assign) NSInteger tag;
/*init property member var by parsing NSDictionary parameter*/
- (id)initWithDictionary:(NSDictionary *)dictionary;
@end
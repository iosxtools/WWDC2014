/*
 XXXToolBarItemDef.h
 MTestPro
 Created by meme on 22/09/2013 10:47PM.
 Copyright (c) 2013 meme. All rights reserved.
 */
@interface XXXToolBarItemDef : NSObject
@property (nonatomic, strong) NSString *label;
@property (nonatomic, strong) NSString *paletteLabel;
@property (nonatomic, strong) NSString *toolTip;
@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSString *notificationName;
@property (nonatomic, strong) NSString *controllerClass;
@property (nonatomic, assign) BOOL enable;
@property (nonatomic, assign) BOOL selectable;
@property (nonatomic, strong) NSString *identifier;
- (id)initWithItemIdentifier:(NSString*)identifier;
@end
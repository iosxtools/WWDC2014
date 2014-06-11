//
//  XXXNSTableColumnField.h
//  XXXARC
//
//  Created by @iosxtools on Twitter on on 7/31/13.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#import <Foundation/Foundation.h>




typedef enum {
    DBCellTypeLabel = 0,
    DBCellTypeTextField = 1,
    DBCellTypeComboBox = 2,
    DBCellTypeCheckBox = 3,
    DBCellTypeRadioBox = 4 ,
    DBCellTypePopUpButton = 5 ,
    DBCellTypeImageView = 6,
} DBCellType;
@interface XXXNSTableColumnField : NSObject
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *identifier;
@property(nonatomic,assign)DBCellType cellType;
@property(nonatomic,assign)NSTextAlignment dataAlignment;
@property(nonatomic,assign)NSTextAlignment headerAlignment;
@property(nonatomic,assign)NSLineBreakMode linkBreakMode;
@property(nonatomic,assign)CGFloat width;
@property(nonatomic,assign)CGFloat minWidth;
@property(nonatomic,assign)BOOL editable;
@property(nonatomic,strong)NSArray *items;
@property(nonatomic,strong)id defaultVal;
@property(nonatomic,assign)int fontSize;
@end

//
//  XXXFormElement.h
//  XXXARC
//
//  Created by @iosxtools on Twitter 9/9/13.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    XXXFormElementTypeLabel = 0,
    XXXFormElementTypeTextField = 1,
    XXXFormElementTypeComboBox = 2,
    XXXFormElementTypeCheckBox = 3,
    XXXFormElementTypeRadioBox = 4 ,
    XXXFormElementTypePopUpButton = 5 ,
    XXXFormElementTypeImageView = 6,
} XXXFormElementType;

@interface XXXFormElement : NSObject
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *identifier;
@property(nonatomic,assign)XXXFormElementType elementType;
@property(nonatomic,assign)NSTextAlignment alignment;
@property(nonatomic,assign)CGFloat width;
@property(nonatomic,assign)CGFloat minWidth;
@property(nonatomic,assign)BOOL editable;
@property(nonatomic,assign)BOOL required;
@property(nonatomic,strong)NSArray *items;
@property(nonatomic,strong)id defaultVal;

@end

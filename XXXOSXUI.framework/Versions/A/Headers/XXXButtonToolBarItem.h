//
//  XXXButtonToolBarItem.h
//  XXXARC
//
//  Created by @iosxtools on Twitter 9/24/13.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

typedef enum {
    XXXButtonToolBarItemTypeLabel = 0,
    XXXButtonToolBarItemTypeTextField = 1,
    XXXButtonToolBarItemTypeComboBox = 2,
    XXXButtonToolBarItemTypeCheckBox = 3,
    XXXButtonToolBarItemTypeRadioBox = 4 ,
    XXXButtonToolBarItemTypePopUpButton = 5 ,
    XXXButtonToolBarItemTypeImageView = 6,
    XXXButtonToolBarItemTypeButton = 7,
} XXXButtonToolBarItemType;

#import <Foundation/Foundation.h>

@interface XXXButtonToolBarItem : NSObject
@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *tooltips;
@property (nonatomic, assign) NSInteger alignment;
@property (nonatomic, assign) NSInteger width;
@property (nonatomic, assign) XXXButtonToolBarItemType toolBarItemType;
@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSString *alternateImage;
@property (nonatomic, assign) BOOL enable;
@property (nonatomic, assign) BOOL editable;
@property (nonatomic, strong) NSArray *items;
@end

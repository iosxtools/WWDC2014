//
//  XXXTabViewController.h
//  XXXARC
//
//  Created by @iosxtools on Twitter on on 8/3/13.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#import "XXXCommonViewController.h"

@interface XXXTabViewController : XXXCommonViewController<NSTabViewDelegate>
@property(nonatomic,strong)NSTabView *tabView;
@property(nonatomic,strong)NSArray *tabTitleItems;
@property(nonatomic,strong)NSArray *controllers;
@property(nonatomic,assign)float tabViewTopPadding;
@property(nonatomic,assign)float tabViewLeftPadding;
- (void)tabReLayout;
- (void)tabViewConfig;
- (void)tabViewSizeConfig;
- (void)tabSubViewSizeConfig;
- (NSArray*)tabColumnsDef;
@end

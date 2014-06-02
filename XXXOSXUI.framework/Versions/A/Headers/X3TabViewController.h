//
//  X3TabViewController.h
//  XXXV2
//
//  Created by @iosxtools on Twitter 12/3/13.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#import "X3CommonViewController.h"

@interface X3TabViewController : X3CommonViewController<NSTabViewDelegate>
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

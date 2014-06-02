//
//  XXXTabXibViewController.h
//  XXXARC
//
//  Created by @iosxtools on Twitter 10/19/13.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#import "XXXCommonViewController.h"

@interface XXXTabXibViewController : XXXCommonViewController<NSTabViewDelegate>

@property(nonatomic,strong)IBOutlet NSTabView *tabView;
@property(nonatomic,strong)NSArray *tabTitleItems;
@property(nonatomic,strong)NSArray *controllers;
- (void)tabReLayout;
- (void)tabViewConfig;
- (void)tabViewSizeConfig;
- (void)tabSubViewSizeConfig;
- (NSArray*)tabColumnsDef;
@end

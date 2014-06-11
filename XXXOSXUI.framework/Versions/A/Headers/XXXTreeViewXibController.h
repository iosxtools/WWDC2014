//
//  XXXTreeViewXibController.h
//  XXXARC
//
//  Created by @iosxtools on Twitter 9/4/13.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#import "XXXCommonViewController.h"
#import "XXXButtonToolBar.h"
#import "XXXButtonToolBarItem.h"
@interface XXXTreeViewXibController : XXXCommonViewController
@property(nonatomic,strong) IBOutlet  NSOutlineView *treeView;
@property(nonatomic,strong)IBOutlet NSScrollView *treeViewScrollView;
@end

//
//  X3CommonViewController.h
//  XXXV2
//
//  Created by @iosxtools on Twitter 12/3/13.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import "XXXButtonToolBar.h"
#import "XXXButtonToolBarItem.h"
@interface X3CommonViewController : NSViewController
@property(nonatomic,unsafe_unretained)NSWindow  *parentWindow;
@property(nonatomic,assign)int tag;
@property(nonatomic,strong)XXXButtonToolBar *toolBarView;
- (id)initWithNib;
- (id)initWithNullNib;
- (void)setupDefaultToolBarView;
- (void)setUpDefaultToolBarConfig;
- (void)setUpToolBarConfig;
- (void)layoutToolBar;
- (BOOL)hasToolBar;


- (void)displayActivityView;
- (void)hideActivityView;
- (NSProgressIndicator*)progressBarIndicator;
- (void)displayBarStyleActivityView;
- (void)hideBarStyleActivityView;
- (void)barStyleActivityViewConfig;
- (void)viewConfig;
- (void)viewSizeConfig;
- (void)tableViewConfig;
- (void)tabViewConfig;
- (void)treeViewConfig;
- (void)splitViewConfig;
- (void)resizeUI;
- (void)refreshView;
- (void)refreshViewWithData:(id)data;
- (void)buttonActionConfig;
- (IBAction)buttonClicked:(id)sender;
@end

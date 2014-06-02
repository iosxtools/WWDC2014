//
//  X3TableViewController.h
//  XXXV2
//
//  Created by @iosxtools on Twitter 12/3/13.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#import "X3CommonViewController.h"
#import "XXXTableViewDataDelegate.h"
#import "XXXButtonToolBar.h"
#import "XXXButtonToolBarItem.h"
@interface X3TableViewController : X3CommonViewController
@property(nonatomic,strong)NSTableView *tableView;
@property(nonatomic,strong)NSScrollView *tableViewScrollView;
- (void)registerRowDrag;
- (void)setTableViewEditFoucusAtColumn:(int)columnIndex;
- (void)setTableViewLostEditFoucus;
- (void)setSortColumns;
- (NSArray*)tableColumnsDef;
- (void)resizeTableViewColumnWidth;
@end

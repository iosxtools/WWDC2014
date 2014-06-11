//
//  XXXTableViewController.h
//  XXXARC
//
//  Created by @iosxtools on Twitter on on 8/4/13.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#import "XXXCommonViewController.h"
#import "XXXTableViewDataDelegate.h"
#import "XXXButtonToolBar.h"
#import "XXXButtonToolBarItem.h"
@interface XXXTableViewController : XXXCommonViewController
@property(nonatomic,strong)NSTableView *tableView;
@property(nonatomic,strong)NSScrollView *tableViewScrollView;
- (void)registerRowDrag;
- (void)setTableViewEditFoucusAtColumn:(int)columnIndex;
- (void)setTableViewLostEditFoucus;
- (void)setSortColumns;
- (NSArray*)tableColumnsDef;
- (void)setAutoSaving:(BOOL)autoSaving;
@end


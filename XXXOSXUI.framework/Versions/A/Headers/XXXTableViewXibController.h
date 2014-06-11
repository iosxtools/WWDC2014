//
//  XXXTableViewXibController.h
//  XXXARC
//
//  Created by @iosxtools on Twitter 9/5/13.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#import "XXXCommonViewController.h"
#import "XXXButtonToolBar.h"
#import "XXXButtonToolBarItem.h"
@interface XXXTableViewXibController : XXXCommonViewController
@property(nonatomic,strong)NSTableView *tableView;
@property(nonatomic,strong)NSScrollView *tableViewScrollView;
- (void)setTableViewEditFoucusAtColumn:(int)columnIndex;
- (void)setTableViewLostEditFoucus;
- (void)setSortColumns;
- (NSArray*)tableColumnsDef;
- (void)setAutoSaving:(BOOL)autoSaving;
@end

//
//  X3TableViewPageController.h
//  XXXV2
//
//  Created by @iosxtools on Twitter 12/3/13.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#import "X3DoubleEidtTableViewController.h"
@interface X3TableViewPageController : X3DoubleEidtTableViewController

@property(nonatomic,strong)XXXPageManager *pageManager;
- (NSInteger)currentPageIndex;
- (NSInteger)pageSize;
- (NSInteger)pageTotalNum;
- (NSInteger)totalRowNum;
- (BOOL)isFirstPage;
- (BOOL)isLastPage;
- (BOOL)nextPage;
- (BOOL)prePage;
- (BOOL)goPage:(NSInteger)pageIndex;
- (void)updatePageInfo;
@end




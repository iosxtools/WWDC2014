//
//  XXXTableViewPageControllerViewController.h
//  XXXARC
//
//  Created by @iosxtools on Twitter 9/28/13.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#import "XXXDoubleEidtTableViewController.h"
@class XXXPageManager;
@interface XXXTableViewPageControllerViewController : XXXDoubleEidtTableViewController
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

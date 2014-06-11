//
//  XXXTableViewXibPageController.h
//  XXXARC
//
//  Created by @iosxtools on Twitter 9/30/13.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#import "XXXTableViewXibController.h"
@class XXXPageManager;
@interface XXXTableViewXibPageController : XXXTableViewXibController
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

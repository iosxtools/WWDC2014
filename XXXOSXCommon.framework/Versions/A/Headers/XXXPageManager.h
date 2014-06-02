//
//  XXXPageManager.h
//  XXXARC
//
//  Created by @iosxtools on Twitter 9/28/13.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XXXPageManager : NSObject
@property(nonatomic,assign)NSInteger  currentPageIndex;
@property(nonatomic,assign)NSInteger  currentPageSize;
@property(nonatomic,assign)NSInteger  pageSize;
@property(nonatomic,assign)NSInteger  pageTotalNum;
@property(nonatomic,assign)NSInteger  totalRowNum;
- (BOOL)isFirstPage;
- (BOOL)isLastPage;
- (BOOL)goPage:(NSInteger)index;
- (BOOL)nextPage;
- (BOOL)prePage;
@end

//
//  XXXGridViewController.h
//  XXXARC
//
//  Created by @iosxtools on Twitter on on 8/19/13.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#import "XXXCommonViewController.h"
@class XXXGridViewDataSource;
@interface XXXGridViewController : XXXCommonViewController
@property(nonatomic,strong)NSCollectionView *collectionView;
@property(nonatomic,strong)NSScrollView *scrollView;
@property(nonatomic,strong)Class bindGridViewClass;
@property(nonatomic,readonly,strong)XXXGridViewDataSource *dataSource;
- (void)registerItemPrototype:(NSCollectionViewItem*)item;
- (void)reloadData;
- (void)setDataSource:(XXXGridViewDataSource *)dataSource;
@end

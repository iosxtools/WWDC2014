//
//  X3GridViewController.h
//  XXXV2
//
//  Created by @iosxtools on Twitter 12/4/13.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#import "X3CommonViewController.h"
@class XXXGridViewDataSource;
@interface X3GridViewController : X3CommonViewController
@property(nonatomic,strong)NSCollectionView *collectionView;
@property(nonatomic,strong)NSScrollView *scrollView;
@property(nonatomic,strong)Class bindGridViewClass;
@property(nonatomic,readonly,strong)XXXGridViewDataSource *dataSource;
- (void)registerItemPrototype:(NSCollectionViewItem*)item;
- (void)reloadData;
- (void)setDataSource:(XXXGridViewDataSource *)dataSource;
@end

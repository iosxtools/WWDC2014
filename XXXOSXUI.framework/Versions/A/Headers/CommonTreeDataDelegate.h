//
//  CommonTreeDataDelegate.h
//  XXXARC
//
//  Created by @iosxtools on Twitter on on 7/28/13.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonTreeDataDelegate : NSObject<NSOutlineViewDataSource,NSOutlineViewDelegate>
@property(nonatomic,strong)NSMutableDictionary *treeNodes;
@property(nonatomic,weak)id currentNodeItem;
@property(nonatomic,copy)treeNodeSelectChangedCallback callback;
- (void)setData:(id)data;
@end

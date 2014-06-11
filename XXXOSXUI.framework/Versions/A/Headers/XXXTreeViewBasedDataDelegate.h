//
//  XXXTreeViewBasedDataDelegate.h
//  XXXARC
//
//  Created by @iosxtools on Twitter on on 8/10/13.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XXXTreeViewBasedDataDelegate : NSObject<NSOutlineViewDataSource,NSOutlineViewDelegate>
@property(nonatomic,strong)NSMutableDictionary *treeNodes;
@property(nonatomic,strong)NSMutableArray *treeMembers;
@property(nonatomic,weak)id currentNodeItem;
@property(nonatomic,weak)NSOutlineView *owner;
@property(nonatomic,copy)treeNodeSelectChangedCallback callback;
- (void)setData:(id)data;
- (void)addData:(id)data;
- (NSInteger)firstValidLeafNodeIndex;
- (void)deleteData:(id)data;
- (NSUInteger)indexOfItem:(id)item;
- (NSUInteger)indexOfItem:(id)item parentItem:(id)parentItem;
- (void)deleteItem:(id)item parentItem:(id)parentItem;
- (NSUInteger)topItemCount;

- (void)moveItem:(id)item toIndexPath:(NSIndexPath*)indexPath;
- (id)itemOfRow:(NSInteger)row;
- (NSArray*)itemsAtIndexSet:(NSIndexSet*)indexSet;
- (BOOL)isLeafItem:(id)item;
@end

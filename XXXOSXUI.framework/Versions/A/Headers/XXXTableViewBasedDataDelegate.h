//
//  XXXTableViewBasedDataDelegate.h
//  XXXOSXUI
//
//  Created by @iosxtools on Twitter 12/8/13.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^UpdateCallbackBlock)(id obj);
typedef void(^ActionCallbackBlock)(NSInteger index,  id obj);
typedef void(^RowDragCallbackBlock)();
typedef void(^RowObjectValueChangedCallbackBlock)(id obj,NSInteger row);
extern NSString * const XXXTableViewDragDataTypeName;

@interface XXXTableViewBasedDataDelegate : NSObject<NSTableViewDataSource,NSTableViewDelegate>
@property(nonatomic,strong)Class bindClass;
@property(nonatomic,strong)NSMutableArray *items;
@property(nonatomic,strong)NSMutableArray *itemCache;
@property(nonatomic,weak)NSTableView *owner;
@property(nonatomic,weak)id actionCallbackBlock;
@property(nonatomic,copy)ActionCallbackBlock actionCallback;
@property(nonatomic,copy)UpdateCallbackBlock callback;
@property(nonatomic,copy)RowDragCallbackBlock rowDragCallback;
@property(nonatomic,copy)RowObjectValueChangedCallbackBlock rowObjectValueChangedCallback;
- (void)setData:(id)data;
- (void)addData:(id)data;
- (void)addNewData;
- (IBAction)addEmptyRow:(id)sender;
- (void)deleteData:(id)data;
- (void)deleteDataAtIndex:(NSUInteger)index;
- (void)deleteDataIndexes:(NSIndexSet*)indexSet;
- (void)clearData;
- (NSInteger)itemCount;
- (id)itemOfRow:(NSInteger)row;
- (void)updateItem:(id)item row:(NSInteger)row;
- (NSArray*)itemsOfIndexSet:(NSIndexSet*)indexSet;
- (void)setPredicate:(id)predicate;
- (void)filterData;
- (void)cancelFilter;

- (void)insertObject:(id)anObject atIndex:(NSUInteger)index;
- (void)removeObjectAtIndex:(NSUInteger)index;
- (void)exchangeObjectAtIndex:(NSUInteger)idx1 withObjectAtIndex:(NSUInteger)idx2;

@end

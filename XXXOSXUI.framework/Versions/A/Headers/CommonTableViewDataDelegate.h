//
//  CommonTableViewDataDelegate.h
//  XXXARC
//
//  Created by @iosxtools on Twitter on on 7/4/13.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^UpdateCallbackBlock)(id obj);
@interface CommonTableViewDataDelegate : NSObject<NSTableViewDataSource,NSTableViewDelegate>
@property(nonatomic,strong)NSMutableArray *items;
@property(nonatomic,strong)NSMutableArray *itemCache;
@property(nonatomic,weak)id owner;
@property(nonatomic,copy)UpdateCallbackBlock callback;
- (void)setData:(id)data;
- (void)addData:(id)data;
- (void)deleteData:(id)data;
- (void)clearData;
- (NSInteger)itemCount;
- (id)itemOfRow:(NSInteger)row;
- (void)setPredicate:(id)predicate;
- (void)filterData;
- (void)cancelFilter;
@end

//
//  CommonTreeViewDelegate.h
//  XXXTest
//
//  Created by @iosxtools on Twitter on on 6/5/13.
//
//

#import <Foundation/Foundation.h>
@interface CommonTreeViewDelegate : NSObject<NSOutlineViewDataSource,NSOutlineViewDelegate>
@property(nonatomic,copy)treeNodeSelectChangedCallback callback;
@property(nonatomic,strong)NSMutableDictionary *treeNodes;
- (void)setData:(id)data;
@end

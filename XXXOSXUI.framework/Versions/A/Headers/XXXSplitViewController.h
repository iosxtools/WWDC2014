//
//  XXXSplitViewController.h
//  XXXARC
//
//  Created by @iosxtools on Twitter on on 8/4/13.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#import "XXXCommonViewController.h"

@interface XXXSplitViewController : XXXCommonViewController<NSSplitViewDelegate>
@property(nonatomic,strong)NSSplitView *splitView;
@property(nonatomic,strong)NSArray *controllers;
@property(nonatomic,assign)NSInteger splitDividPositon;
- (void)splitViewConfig;
- (NSView*)leftView;
- (NSView*)rightView;
@end

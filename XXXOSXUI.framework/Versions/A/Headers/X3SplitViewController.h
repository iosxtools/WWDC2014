//
//  X3SplitViewController.h
//  XXXV2
//
//  Created by @iosxtools on Twitter 12/4/13.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//
#import "X3CommonViewController.h"
@class X3SplitView;
@interface X3SplitViewController : X3CommonViewController<NSSplitViewDelegate>
@property(nonatomic,strong)X3SplitView *splitView;
@property(nonatomic,strong)NSArray *controllers;
@property(nonatomic,assign)NSInteger splitDividPositon;
- (void)splitViewConfig;
- (NSView*)leftView;
- (NSView*)rightView;
@end

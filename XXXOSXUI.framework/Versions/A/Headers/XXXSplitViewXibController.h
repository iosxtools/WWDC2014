//
//  XXXSplitViewXibController.h
//  XXXARC
//
//  Created by @iosxtools on Twitter 9/4/13.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#import "XXXCommonViewController.h"

@interface XXXSplitViewXibController : XXXCommonViewController<NSSplitViewDelegate>
@property(nonatomic,strong)IBOutlet NSSplitView *splitView;
@property(nonatomic,strong)NSArray *controllers;
@property(nonatomic,assign)NSInteger splitDividPositon;
- (void)splitViewConfig;
@end

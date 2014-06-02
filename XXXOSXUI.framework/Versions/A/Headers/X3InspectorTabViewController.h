//
//  X3InspectorTabViewController.h
//  XXXV2
//
//  Created by @iosxtools on Twitter 12/4/13.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#import "X3TabViewController.h"
@class SMTabBar;
@interface X3InspectorTabViewController : X3TabViewController
@property(nonatomic,strong)SMTabBar *inspectorTabBar;
- (void)selectedAtIndex:(int)index;
@end

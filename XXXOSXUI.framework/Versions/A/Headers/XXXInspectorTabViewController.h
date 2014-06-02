//
//  XXXInspectorTabViewController.h
//  XXXARC
//
//  Created by @iosxtools on Twitter on on 8/9/13.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#import "XXXTabViewController.h"
@class SMTabBar;
@interface XXXInspectorTabViewController : XXXTabViewController
@property(nonatomic,strong)SMTabBar *inspectorTabBar;
- (void)selectedAtIndex:(int)index;
@end

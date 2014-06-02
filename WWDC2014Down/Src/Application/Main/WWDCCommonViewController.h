//
//  WWDCCommonViewController.h
//  WWDC2014
//
//  Created by @iosxtools on Twitter on 14-5-29.
//  Copyright (c) 2014 http://www.iosxtools.com All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface WWDCCommonViewController : NSViewController
@property(nonatomic,assign)NSWindow *parentWindow;
@property(nonatomic,strong)NSTableView *tableView;
- (void)displayActivityView;
- (void)hideActivityView;
@end

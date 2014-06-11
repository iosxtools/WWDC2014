//
//  AppDelegate.h
//  WWDC2014Down
//
//  Created by @iosxtools on Twitter on 14-5-28.
//  Copyright (c) 2014 http://www.iosxtools.com All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "WWDCCommonAppDelegate.h"
//#import "XXXAppDelegate.h"
@interface AppDelegate : WWDCCommonAppDelegate
@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSToolbar *toolBar;
- (IBAction)aboutToolBarItemClick:(id)sender;
@property (weak) IBOutlet NSSearchField *searchField;
- (IBAction)prefrenceMenuAction:(id)sender;
- (IBAction)acknowledgmentMenuAction:(id)sender;
- (IBAction)searchToolBarItemClick:(id)sender;
- (NSWindow*)appWindow;
@end

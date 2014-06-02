//
//  AppStoreViewController.h
//  WWDC2014
//
//  by @iosxtools on Twitter on 14-5-31.
//  Copyright (c) http://www.iosxtools.com. All rights reserved.
//

#import <XXXOSXUI/XXXOSXUI.h>

@interface AppStoreViewController : X3CommonViewController
@property (weak) IBOutlet HoverTableView *tableView;
- (IBAction)goAction:(id)sender;
@end

//
//  AppDelegate.m
//  WWDC2014Down
//
//  Created by @iosxtools on Twitter on 14-5-28.
//  Copyright (c) 2014 http://www.iosxtools.com All rights reserved.
//

#import "AppDelegate.h"
#import "AboutWindowController.h"
#import "SettingsWindowController.h"
#import "SharePopoverViewController.h"
#import "AppStoreViewController.h"
#import "WWDCMainViewController.h"
#import "WWDCDownloadWindowController.h"
#import "WWDCDownloadTableViewController.h"
#import "WWDCDownloadViewController.h"
//view controller

#import "WWDCBO.h"


@interface AppDelegate ()
@property(nonatomic,strong)WWDCDownloadWindowController *downloadWindowController;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [self parseWWDCWebURLLink];
}

- (void)parseWWDCWebURLLink
{
    [[WWDCBO sharedInstance]parseWWDCDownloadLink];

}

- (IBAction)defaultToolBarItemClick:(id)sender
{
    NSToolbarItem *toolBarItem = sender;
    NSString *identifier = toolBarItem.itemIdentifier;
    if([self.currentViewIdentifier isEqualToString:identifier])
    {
        return;
    }
    self.currentViewIdentifier = identifier;
    //view controller probe    =           ;
    DLog(@"identifier=%@",identifier);
    X3CommonViewController *controller =  (X3CommonViewController*)[[RouteManager sharedInstance]open:identifier];
    if(controller){
        controller.parentWindow = self.window;
        NSRect frame = [self.window.contentView bounds];
        NSView *view = controller.view;
        view.frame =frame;
        self.window.contentView = view;
    }
  
}

- (IBAction)wWDCHomeToolBarItemClick:(id)sender
{
    NSString *wwdcHomeUrl = @"https://developer.apple.com/videos/wwdc/2014/";
    NSURL *url = [NSURL URLWithString:wwdcHomeUrl];
    if( [[NSWorkspace sharedWorkspace] openURL:url] ){
        DLog(@"Failed to open url: %@",[url description]);
    }
}

- (IBAction)searchToolBarItemClick:(id)sender
{
    DLog(@"sender=%@",sender);
    NSSearchField *field = sender;
    NSString *searchString = [field.stringValue trim];

    [[NSNotificationCenter defaultCenter
          ]postNotificationName:kSearchTextChangedNotification object:searchString];
    
}

- (IBAction)downloadToolBarItemClick:(id)sender
{
    
    [self.downloadWindowController showWindow:self];
    [self.downloadWindowController.window center];
}

#pragma menu action
- (IBAction)acknowledgmentMenuAction:(id)sender;
{
    NSString *url = @"http://www.iosxtools.com/WWDC2014";
    [NSURL openURL:url];
}

- (IBAction)prefrenceMenuAction:(id)sender
{
    [self settingsToolBarItemClick:sender];
}

- (void)viewControllerRouteConfig
{
    [[RouteManager sharedInstance]map:kMainVCID toViewController:[WWDCMainViewController class]];
    [[RouteManager sharedInstance]map:kDownloadTableViewVC toViewController:[WWDCDownloadTableViewController class]];
    
    [[RouteManager sharedInstance]map:kDownloadViewVC toViewController:[WWDCDownloadViewController class]];
    
   
    
}

- (NSWindow*)mainWindow
{
    return self.window;
}

- (NSToolbar*)mainToolBar
{
    return self.toolBar;
}

- (NSViewController*)startViewController
{
    return [[RouteManager sharedInstance]open:kMainVCID];
}

- (WWDCDownloadWindowController*)downloadWindowController
{
    if(!_downloadWindowController)
    {
        _downloadWindowController = [[WWDCDownloadWindowController alloc]initWithWindowNibName:@"WWDCDownloadWindowController"];
    }
    return _downloadWindowController;
}
@end

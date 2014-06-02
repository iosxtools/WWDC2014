//
//  WWDCCommonAppDelegate.m
//  WWDC2014
//
//  Created by @iosxtools on Twitter on 14-5-30.
//  Copyright (c) 2014 http://www.iosxtools.com All rights reserved.
//

#import "WWDCCommonAppDelegate.h"
#import "AboutWindowController.h"
#import "SettingsWindowController.h"
#import "SharePopoverViewController.h"
#import "AppStoreViewController.h"
@interface WWDCCommonAppDelegate ()<NSPopoverDelegate>

@property(nonatomic,strong) SettingsWindowController *settingsWindowController;
@property(nonatomic,strong) SharePopoverViewController *sharePopoverViewController;
@property(nonatomic,strong) AppStoreViewController *appStoreViewController;
@property(nonatomic,strong) NSPopover *sharePopover;
@property(nonatomic,strong) NSPopover *appStorePopover;
@property(nonatomic,strong) AboutWindowController *aboutWindowController;
@end
@implementation WWDCCommonAppDelegate


- (void)openDataBase
{
    [[DataBaseBO sharedInstance]openDataBase];
}

- (NSDictionary*)toolBarIditifers
{
    return @{
             kToolBarHomeID:kToolBarHomeID,
             kToolBarShareID:kToolBarShareID,
             kToolBarSettingsID:kToolBarSettingsID,
             kToolBarAboutID:kToolBarAboutID,
             kWWDCHome:kWWDCHome,
             kDownloadVC:kDownloadVC,
             kAppStoreTableViewVC:kAppStoreTableViewVC,
             kSearchID:kSearchID
             };
}


#pragma controller


- (IBAction)aboutToolBarItemClick:(id)sender
{
    [self showAboutWindow];
}
- (IBAction)homeToolBarItemClick:(id)sender
{
    [self goHomePage];
}
- (IBAction)settingsToolBarItemClick:(id)sender
{
    [self showSettingsWindow];
}
- (IBAction)shareToolBarItemClick:(id)sender
{
    NSView *itemView = sender;//[item view];
    [self.sharePopover showRelativeToRect:[itemView bounds] ofView:itemView preferredEdge:NSMaxYEdge];
}
- (IBAction)appStoreToolBarItemClick:(id)sender
{
    NSView *itemView = sender;//[item view];
    [self.appStorePopover showRelativeToRect:[itemView bounds] ofView:itemView preferredEdge:NSMaxYEdge];
}
- (void)showSettingsWindow
{
    [self.settingsWindowController showWindow:self];
    [self.settingsWindowController.window center];
    
}
- (void)showAboutWindow
{
    [self.aboutWindowController showWindow:self];
    [self.aboutWindowController.window center];
}
- (void)goHomePage
{
    NSURL *url = [NSURL URLWithString:kAppHomeURL];
    if( [[NSWorkspace sharedWorkspace] openURL:url] ){
        DLog(@"Failed to open url: %@",[url description]);
    }
}


- (NSPopover*)sharePopover
{
    if(!_sharePopover){
        _sharePopover = [[NSPopover alloc] init];
        
        _sharePopover.animates = 1;
        
        
        _sharePopover.behavior = NSPopoverBehaviorTransient;
        
        _sharePopover.delegate = self;
        
    }
    _sharePopover.contentViewController = self.sharePopoverViewController;
    return _sharePopover;
    
}

- (NSPopover*)appStorePopover
{
    if(!_appStorePopover){
        _appStorePopover = [[NSPopover alloc] init];
        
        _appStorePopover.animates = 1;
        
        
        _appStorePopover.behavior = NSPopoverBehaviorTransient;
        
        _appStorePopover.delegate = self;
        
    }
    _appStorePopover.contentViewController = self.appStoreViewController;
    return _appStorePopover;
    
}

- (AboutWindowController*)aboutWindowController
{
    if(!_aboutWindowController){
        _aboutWindowController = [[AboutWindowController alloc]initWithWindowNibName:@"AboutWindowController"];
    }
    
    return _aboutWindowController;
}
- (SharePopoverViewController*)sharePopoverViewController
{
    if(!_sharePopoverViewController){
        _sharePopoverViewController = [[SharePopoverViewController alloc]initWithNibName:@"SharePopoverViewController" bundle:nil];
        //_sharePopoverViewController.parentWindow = self.osxMainWindow;
    }
    return _sharePopoverViewController;
}
- (AppStoreViewController*)appStoreViewController
{
    if(!_appStoreViewController){
        _appStoreViewController = [[AppStoreViewController alloc]initWithNibName:@"AppStoreViewController" bundle:nil];
        //_sharePopoverViewController.parentWindow = self.osxMainWindow;
    }
    return _appStoreViewController;
}
- (SettingsWindowController*)settingsWindowController
{
    if(!_settingsWindowController){
        _settingsWindowController = [[SettingsWindowController alloc]initWithWindowNibName:@"SettingsWindowController"];
    }
    
    return _settingsWindowController;
}

@end

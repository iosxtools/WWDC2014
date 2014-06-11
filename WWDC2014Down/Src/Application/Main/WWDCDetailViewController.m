/*
 WWDCDetailViewController.m
 APPProbe
 Created by @iosxtools on Twitter 09/06/2014 10:06AM.
 Copyright (c) http://www.iosxtools.com. All rights reserved.
 */

#import "WWDCDetailViewController.h"
#import "WWDCDetailTableViewController.h"
#import "WWDCDownloadQueueTableViewController.h"
@interface WWDCDetailViewController ()
@property(nonatomic,strong)WWDCDetailTableViewController *wWDCDetailTableViewController;
@property(nonatomic,strong)WWDCDownloadQueueTableViewController *wWDCDownloadQueueTableViewController;


@end

@implementation WWDCDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    return [super initWithNibName:nil bundle:nil];
}
- (void)awakeFromNib{
    [super awakeFromNib];
    [self registerSlideNotify];
    [self openCloseTargetView];
}

- (void)registerSlideNotify
{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(recvOpenMainSlideNotification:) name:kOpenCloseDownViewNotification object:nil];
    
    
    
    //[[NSNotificationCenter defaultCenter]addObserver:kOpenMainSlideNotification selector:@selector(recvOpenMainSlideNotification:) object:nil];
}

#pragma collapseView config


- (void)recvOpenMainSlideNotification:(NSNotification*)notification
{
    [self openCloseTargetView];
}



- (void)splitViewControllersConfig{
    self.controllers = @[self.wWDCDetailTableViewController,self.wWDCDownloadQueueTableViewController];
}
- (void)splitViewSizeConfig{
    [self.splitView setVertical:NO];
    [self.splitView setPosition:self.view.height/2 ofDividerAtIndex:0];
}
- (WWDCDetailTableViewController*)wWDCDetailTableViewController{
    if(!_wWDCDetailTableViewController){
        _wWDCDetailTableViewController = [[WWDCDetailTableViewController alloc]initWithNibName:@"WWDCDetailTableViewController" bundle:nil];
        _wWDCDetailTableViewController.parentWindow = self.parentWindow;
    }
    return _wWDCDetailTableViewController;
}
- (WWDCDownloadQueueTableViewController*)wWDCDownloadQueueTableViewController{
    if(!_wWDCDownloadQueueTableViewController){
        _wWDCDownloadQueueTableViewController = [[WWDCDownloadQueueTableViewController alloc]initWithNibName:@"WWDCDownloadQueueTableViewController" bundle:nil];
        _wWDCDownloadQueueTableViewController.parentWindow = self.parentWindow;
    }
    return _wWDCDownloadQueueTableViewController;
}

@end

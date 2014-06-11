/*
 WWDCDownloadViewController.m
 APPProbe
 Created by @iosxtools on Twitter on 31/05/2014 06:02AM.
 Copyright (c) http://www.iosxtools.com  All rights reserved.
 */

#import "WWDCDownloadViewController.h"
#import "WWDCDownloadTableViewController.h"
#import "WWDCDownloadQueueTableViewController.h"
@interface WWDCDownloadViewController ()
@property(nonatomic,strong)WWDCDownloadTableViewController *wWDCDownloadTableViewController;
@property(nonatomic,strong)WWDCDownloadQueueTableViewController *wWDCDownloadQueueTableViewController;
@end

@implementation WWDCDownloadViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    return [super initWithNibName:nil bundle:nil];
}
- (void)awakeFromNib{
    [super awakeFromNib];
}
- (void)loadView{
    [super loadView];
    
}
- (void)splitViewControllersConfig{
    self.controllers = @[self.wWDCDownloadTableViewController,self.wWDCDownloadQueueTableViewController];
}
- (void)splitViewSizeConfig{
    [self.splitView setVertical:NO];
    [self.splitView setPosition:self.view.height/2 ofDividerAtIndex:0];
}
- (WWDCDownloadTableViewController*)wWDCDownloadTableViewController{
    if(!_wWDCDownloadTableViewController){
        _wWDCDownloadTableViewController = [[WWDCDownloadTableViewController alloc]initWithNibName:@"WWDCDownloadTableViewController" bundle:nil];
        _wWDCDownloadTableViewController.parentWindow = self.parentWindow;
    }
    return _wWDCDownloadTableViewController;
}
- (WWDCDownloadQueueTableViewController*)wWDCDownloadQueueTableViewController{
    if(!_wWDCDownloadQueueTableViewController){
        _wWDCDownloadQueueTableViewController = [[WWDCDownloadQueueTableViewController alloc]initWithNibName:@"WWDCDownloadQueueTableViewController" bundle:nil];
        _wWDCDownloadQueueTableViewController.parentWindow = self.parentWindow;
    }
    return _wWDCDownloadQueueTableViewController;
}
@end

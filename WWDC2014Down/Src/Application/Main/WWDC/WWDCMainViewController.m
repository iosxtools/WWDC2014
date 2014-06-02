/*
 WWDCMainViewController.m
 APPProbe
 Created by @iosxtools on Twitter on 28/05/2014 10:00PM.
 Copyright (c) http://www.iosxtools.com  All rights reserved.
 */

#import "WWDCMainViewController.h"
#import "WWDCCategoryTableViewController.h"
#import "WWDCDetailTableViewController.h"
@interface WWDCMainViewController ()
@property(nonatomic,strong)WWDCCategoryTableViewController *wWDCCategoryTableViewController;
@property(nonatomic,strong)WWDCDetailTableViewController *wWDCDetailTableViewController;
@end

@implementation WWDCMainViewController

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
    self.controllers = @[self.wWDCCategoryTableViewController,self.wWDCDetailTableViewController];
}
- (void)splitViewSizeConfig{
    [self.splitView setPosition:self.view.width/4-10 ofDividerAtIndex:0];
}
- (WWDCCategoryTableViewController*)wWDCCategoryTableViewController{
    if(!_wWDCCategoryTableViewController){
        _wWDCCategoryTableViewController = [[WWDCCategoryTableViewController alloc]initWithNibName:@"WWDCCategoryTableViewController" bundle:nil];
        _wWDCCategoryTableViewController.parentWindow = self.parentWindow;
    }
    return _wWDCCategoryTableViewController;
}
- (WWDCDetailTableViewController*)wWDCDetailTableViewController{
    if(!_wWDCDetailTableViewController){
        _wWDCDetailTableViewController = [[WWDCDetailTableViewController alloc]initWithNibName:@"WWDCDetailTableViewController" bundle:nil];
        _wWDCDetailTableViewController.parentWindow = self.parentWindow;
    }
    return _wWDCDetailTableViewController;
}
@end

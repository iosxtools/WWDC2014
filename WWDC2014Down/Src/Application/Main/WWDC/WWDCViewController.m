//
//  WWDCViewController.m
//  WWDCDown
//
//  Created by @iosxtools on Twitter on 14-6-9.
//  Copyright (c) 2014年 http://www.iosxtools.com. All rights reserved.
//

#import "WWDCViewController.h"
#import "WWDCCategoryTableViewController.h"
#import "WWDCDetailViewController.h"
#import "AppDelegate.h"
@interface WWDCViewController ()
@property(nonatomic,strong)WWDCCategoryTableViewController *wWDCCategoryTableViewController;
@property(nonatomic,strong)WWDCDetailViewController *wWDCDetailViewController;
@end

@implementation WWDCViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
        
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];

}


- (void)splitViewControllersConfig{
    self.controllers = @[self.wWDCCategoryTableViewController,self.wWDCDetailViewController];
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



- (WWDCDetailViewController*)wWDCDetailViewController{
    if(!_wWDCDetailViewController){
        _wWDCDetailViewController = [[WWDCDetailViewController alloc]init];
        _wWDCDetailViewController.parentWindow = self.parentWindow;
    }
    return _wWDCDetailViewController;
}



@end

/*
 WWDCDownTableViewController.m
 APPProbe
 Created by @iosxtools on Twitter 09/06/2014 10:06AM.
 Copyright (c) http://www.iosxtools.com. All rights reserved.
 */

#import "WWDCDownTableViewController.h"
#import "WWDCDownTableViewColumnDefConfig.h"
#import "WWDCDownTableViewDataDelegate.h"
@interface WWDCDownTableViewController ()
@property(nonatomic,strong)WWDCDownTableViewDataDelegate *dataDelegate;
@end

@implementation WWDCDownTableViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    [self fetchData];
}

- (void)fetchData
{
    [self displayActivityView];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //NSArray *dataItems ;
        //[self.dataDelegate setData:dataItems];
        dispatch_async(dispatch_get_main_queue(),^
                       {
                           [self.tableView reloadData];
                           [self hideActivityView];
                       });
        
    });
}


#pragma delegate config
- (void)tableViewDelegateConfig{
    self.tableView.delegate   = self.dataDelegate;
    self.tableView.dataSource = self.dataDelegate;
    
    __weak __typeof(&*self)weakSelf = self;
    self.dataDelegate.callback = ^(id obj){
        __strong __typeof(&*weakSelf)strongSelf = weakSelf;
        if (!strongSelf) {
            return;
        }
       
        /*your business logic*/
        {
            
        }
    };
}
#pragma var init


#if 0
- (NSScrollView*)tableViewXibScrollView{
    return self.wWDCDownTableViewScrollView;
}
- (NSTableView*)tableXibView{
    return self.wWDCDownTableView;
}
#endif

- (NSArray*)tableColumnsDef
{
    return  [WWDCDownTableViewColumnDefConfig defConfig];
}

- (WWDCDownTableViewDataDelegate*)dataDelegate
{
    if(!_dataDelegate){
        _dataDelegate = [[WWDCDownTableViewDataDelegate alloc]init];
    }
    return _dataDelegate;
}

@end

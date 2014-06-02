/*
 WWDCDownloadTableViewController.m
 APPProbe
 Created by @iosxtools on Twitter on 30/05/2014 04:20AM.
 Copyright (c) http://www.iosxtools.com  All rights reserved.
 */

#import "WWDCDownloadTableViewController.h"
#import "WWDCDownloadTableViewColumnDefConfig.h"
#import "WWDCDownloadTableViewDataDelegate.h"
#import "WWDCBO.h"
#import "WWDCDownStateManager.h"
@interface WWDCDownloadTableViewController ()
{
    NSInteger  hdState;
    NSInteger  sdState;
    NSInteger  pdfState;
}
@property(nonatomic,strong)WWDCDownloadTableViewDataDelegate *dataDelegate;
@end

@implementation WWDCDownloadTableViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    hdState = kHDSelectState;
    sdState = kSDSelectState;
    pdfState = kPDFSelectState;
    [self tableViewDelegateConfig];
    [self fetchData];
}

- (void)fetchData
{
    [self displayActivityView];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSArray *downloadItems = [[WWDCBO sharedInstance]wwdcAllDownloadTableItems];
        [self.dataDelegate setData:downloadItems];
        dispatch_async(dispatch_get_main_queue(),^
        {
            [self.tableView reloadData];
            [self hideActivityView];
        });
        
    });
    
}


- (IBAction)allCheckBoxClicked:(id)sender
{
    NSButton *btn = sender;
    BOOL state = btn.state;
    if(state)
    {
        hdState = kHDSelectState;
        sdState = kSDSelectState;
        pdfState = kPDFSelectState;
        
    }
    else
    {
        hdState = 0;
        sdState = 0;
        pdfState = 0;
    }
    
    [self updateTableSelected];
}


- (IBAction)hdCheckBoxClicked:(id)sender
{
    NSButton *btn = sender;
    BOOL state = btn.state;
    if(state){
        hdState = kHDSelectState;
    }
    else{
        hdState = 0;
    }
    [self updateTableSelected];
   
    
}

- (IBAction)sdCheckBoxClicked:(id)sender
{
    NSButton *btn = sender;
    BOOL state = btn.state;
    if(state){
        sdState = kSDSelectState;
    }
    else{
        sdState = 0;
    }
    [self updateTableSelected];

}

- (IBAction)pdfCheckBoxClicked:(id)sender
{
    NSButton *btn = sender;
    BOOL state = btn.state;
    if(state){
        pdfState = kPDFSelectState;
    }
    else{
        pdfState = 0;
    }
    [self updateTableSelected];
}
- (void)updateTableSelected
{
    NSInteger selectState = hdState + sdState +pdfState;
    [self.dataDelegate updateSelectItemState:selectState];
}


- (IBAction)downloadClicked:(id)sender;
{
    NSArray *selectedDowntems = [self.dataDelegate selectedDowntems];
    
    NSString *downPath = [AppPreference sharedPreference].downLoadPath;
    
    [[NSFileManager defaultManager]createPathIfNeded:downPath];
    
    [[WWDCDownStateManager sharedInstance]addDownloads:selectedDowntems];
    
        
}

- (NSTableView*)tableView
{
    return self.wWDCDownloadTableViewTableView;
}

#pragma delegate config
- (void)tableViewDelegateConfig{
    self.tableView.delegate   = self.dataDelegate;
    self.tableView.dataSource = self.dataDelegate;
    self.dataDelegate.owner = self.tableView;
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




- (NSArray*)tableColumnsDef
{
    return  [WWDCDownloadTableViewColumnDefConfig defConfig];
}

- (WWDCDownloadTableViewDataDelegate*)dataDelegate
{
    if(!_dataDelegate){
        _dataDelegate = [[WWDCDownloadTableViewDataDelegate alloc]init];
    }
    return _dataDelegate;
}

@end

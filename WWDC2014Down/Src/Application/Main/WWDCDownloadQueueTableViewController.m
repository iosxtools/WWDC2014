/*
 WWDCDownloadQueueTableViewController.m
 APPProbe
 Created by @iosxtools on Twitter on 31/05/2014 06:02AM.
 Copyright (c) http://www.iosxtools.com  All rights reserved.
 */

#import "WWDCDownloadQueueTableViewController.h"
#import "WWDCDownloadQueueTableViewColumnDefConfig.h"
#import "WWDCDownloadQueueTableViewDataDelegate.h"
#import "WWDCDownStateManager.h"
#import "WWDCDownState.h"
@interface WWDCDownloadQueueTableViewController ()
@property(nonatomic,strong)WWDCDownloadQueueTableViewDataDelegate *dataDelegate;
@end

@implementation WWDCDownloadQueueTableViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (void)dealloc
{
    [self removeDownloadObserver];
}

- (void)awakeFromNib{
    [super awakeFromNib];
    [self tableViewDelegateConfig];
    [self addDownloadObserver];
    [self fetchData];
}

- (void)fetchData2
{
    [self displayActivityView];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSArray *downloadItems = [[WWDCDownStateManager sharedInstance]allSelectedDownloads];
        [self.dataDelegate setData:downloadItems];
        dispatch_async(dispatch_get_main_queue(),^
                       {
                           [self.tableView reloadData];
                           [self hideActivityView];
                       });
        
    });
}

- (void)fetchData
{
 
    NSArray *downloadItems = [[WWDCDownStateManager sharedInstance]allSelectedDownloads];
    if([downloadItems count]<=0){
        return;
    }
    [self.dataDelegate setData:downloadItems];
    [self.tableView reloadData];
    
}


#pragma multi delegate
- (WWDCDownState*)stateDelegate
{
    return [WWDCDownStateManager sharedInstance].state;
}
- (void)removeDownloadObserver{
    [[self stateDelegate] removeDelegate:self delegateQueue:dispatch_get_main_queue()];
}
- (void)addDownloadObserver{
    [[self stateDelegate] addDelegate:self delegateQueue:dispatch_get_main_queue()];
}
- (void)downStart:(WWDCDownState *)sender
{
    [self fetchData];
}
- (void)downCompleted:(WWDCDownState *)sender fileID:(NSInteger)fileID
{
    DLog(@"downCompleted %ld",fileID)
}
- (void)downFailed:(WWDCDownState *)sender fileID:(NSInteger)fileID error:(NSError*)error
{
    DLog(@"downFailed %ld",fileID)
}
- (void)downPercentChanged:(WWDCDownState *)sender fileID:(NSInteger)fileID percent:(double)percent;
{
    DLog(@"downPercentChanged %ld percent%f",fileID,percent);
    
    NSMutableDictionary  *downItemWithFileID = [[WWDCDownStateManager sharedInstance]downItemWithFileID:fileID];
    double lastPercent = [downItemWithFileID[@"percent"]doubleValue];
    
    if(lastPercent!=percent){
        
        downItemWithFileID[@"percent"] = [NSNumber numberWithChar:percent];
        
        [self.tableView reloadData];
    }
    
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

- (NSTableView*)tableView
{
    return self.wWDCDownloadQueueTableViewTableView;
}


- (NSArray*)tableColumnsDef
{
    return  [WWDCDownloadQueueTableViewColumnDefConfig defConfig];
}

- (WWDCDownloadQueueTableViewDataDelegate*)dataDelegate
{
    if(!_dataDelegate){
        _dataDelegate = [[WWDCDownloadQueueTableViewDataDelegate alloc]init];
    }
    return _dataDelegate;
}

@end

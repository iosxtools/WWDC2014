/*
 WWDCDetailTableViewController.m
 APPProbe
 Created by @iosxtools on Twitter on 28/05/2014 10:00PM.
 Copyright (c) http://www.iosxtools.com  All rights reserved.
 */

#import "WWDCDetailTableViewController.h"
#import "WWDCDetailTableViewColumnDefConfig.h"
#import "WWDCDetailTableViewDataDelegate.h"
#import "WWDCBO.h"

@interface WWDCDetailTableViewController ()
@property(nonatomic,strong)WWDCDetailTableViewDataDelegate *dataDelegate;
@property(nonatomic,strong)NSString *trackName;

@end

@implementation WWDCDetailTableViewController

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
    [self tableViewDelegateConfig];
    [self registerDownloadURLParserFinishedNotification];
    [self registerCategoryTrackNotification];
    [self registerSearchTextChangedNotifaction];
    [self fetchAllData];
}





- (void)registerDownloadURLParserFinishedNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(recvDownloadURLParserFinishedNotification:) name:kDownloadURLParserFinishedNotification object:nil];
}
- (void)recvDownloadURLParserFinishedNotification:(NSNotification*)notification
{
    [self fetchAllData];
}

- (void)registerCategoryTrackNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(recvCategoryTrackNotification:) name:kCategoryTrackNotification object:nil];
}
- (void)recvCategoryTrackNotification:(NSNotification*)notification
{
    NSString *trackName = notification.object;
    if(trackName)
    {
        self.trackName = trackName;
        [self fetchTrackData];
    }
    else
    {
        [self fetchAllData];
    }
    
}


- (void)registerSearchTextChangedNotifaction
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(recvSearchTextChangedNotifaction:) name:kSearchTextChangedNotification object:nil];
}
- (void)recvSearchTextChangedNotifaction:(NSNotification*)notification
{
    NSString *searchText = [notification.object trim];
    if(!searchText || searchText.length<=0)
    {
        [self fetchAllData];
    }
    else
    {
        [self fetchFilterData:searchText];
    }
}


- (void)fetchTrackData
{
    [self displayActivityView];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSArray *items = [[WWDCBO sharedInstance] wwdcItemsByTrack:self.trackName];
        [self.dataDelegate setData:items];
        dispatch_async(dispatch_get_main_queue(),^
                       {
                           [self.tableView reloadData];
                           [self hideActivityView];
                       });
        
    });
    
}


- (void)fetchFilterData:(NSString*)text
{
    [self displayActivityView];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSArray *items = [[WWDCBO sharedInstance] wwdcItemsByFilter:text];
        [self.dataDelegate setData:items];
        dispatch_async(dispatch_get_main_queue(),^
                       {
                           [self.tableView reloadData];
                           [self hideActivityView];
                       });
        
    });
    
}

- (void)fetchAllData
{
    [self displayActivityView];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
         NSArray * items = [[WWDCBO sharedInstance] wwdcAllVedioItems];
        if(items.count<=0)
        {
            [self hideActivityView];
            return ;
        }
               [self.dataDelegate setData:items];
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

- (NSTableView*)tableView
{
    return self.wWDCDetailTableView;
}



- (NSArray*)tableColumnsDef
{
    return  [WWDCDetailTableViewColumnDefConfig defConfig];
}

- (WWDCDetailTableViewDataDelegate*)dataDelegate
{
    if(!_dataDelegate){
        _dataDelegate = [[WWDCDetailTableViewDataDelegate alloc]init];
    }
    return _dataDelegate;
}

@end

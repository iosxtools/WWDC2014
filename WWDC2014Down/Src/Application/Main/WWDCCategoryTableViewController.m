/*
 WWDCCategoryTableViewController.m
 APPProbe
 Created by @iosxtools on Twitter on 28/05/2014 10:00PM.
 Copyright (c) http://www.iosxtools.com  All rights reserved.
 */

#import "WWDCCategoryTableViewController.h"
#import "WWDCCategoryTableViewColumnDefConfig.h"
#import "WWDCCategoryTableViewDataDelegate.h"

#import "Track.h"
#import "TrackDAO.h"


@interface WWDCCategoryTableViewController ()<ExtendedTableViewDelegate>
@property(nonatomic,strong)WWDCCategoryTableViewDataDelegate *dataDelegate;
@property(nonatomic,strong)TrackDAO *dao;
@end

@implementation WWDCCategoryTableViewController

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
    [self registerDownloadURLParseFinishedNotifaction];
    [self fetchData];
}

- (void)registerDownloadURLParseFinishedNotifaction
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(recvDownloadURLParseFinishedNotifaction:) name:kDownloadURLParserFinishedNotification object:nil];
}
- (void)recvDownloadURLParseFinishedNotifaction:(NSNotification*)notification
{
    [self fetchData];
}

- (void)fetchData
{
    NSArray *tracks = [self.dao findAll];
    if(tracks.count<=0)
    {
        return;
    }
    [self.dataDelegate setData:tracks];
    [self.tableView reloadData];
}

- (void)tableView:(NSTableView *)tableView didClickedRow:(NSInteger)row {
    
    NSDictionary *item = [self.dataDelegate itemOfRow:row];
    NSString *category = item[@"name"];
    [[NSNotificationCenter defaultCenter] postNotificationName:kCategoryTrackNotification object:category];
    
}

#pragma delegate config
- (void)tableViewDelegateConfig{
    self.tableView.delegate   = self.dataDelegate;
    self.tableView.dataSource = self.dataDelegate;
    HoverTableView *hoverTable = (HoverTableView*)self.tableView;
    hoverTable.extendedDelegate = self;
    //self.tableView.da
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




- (NSTableView*)tableView{
    return self.wWDCCategoryTableView;
}


- (NSArray*)tableColumnsDef
{
    return  [WWDCCategoryTableViewColumnDefConfig defConfig];
}

- (WWDCCategoryTableViewDataDelegate*)dataDelegate
{
    if(!_dataDelegate){
        _dataDelegate = [[WWDCCategoryTableViewDataDelegate alloc]init];
    }
    return _dataDelegate;
}
- (TrackDAO*)dao
{
    if(!_dao)
    {
        _dao = [[TrackDAO alloc]init];
    }
    return _dao;
}
@end

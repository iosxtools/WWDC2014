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
#import "WWDCDownStateManager.h"
@interface WWDCDetailTableViewController ()
@property(nonatomic,strong)WWDCDetailTableViewDataDelegate *dataDelegate;
@property(nonatomic,strong)NSString *trackName;
@property(nonatomic,assign)BOOL  isStart;
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
    [self setControllHidden:YES];
    [self registerDownloadURLParserFinishedNotification];
    [self registerCategoryTrackNotification];
    [self registerSearchTextChangedNotifaction];
    [self registerTableViewScrollNotification];
    [self fetchAllData];
}


- (void)registerTableViewScrollNotification
{
    id clipView = [[self.tableView enclosingScrollView] contentView];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(myBoundsChangeNotificationHandler:)
                                                 name:NSViewBoundsDidChangeNotification
                                               object:clipView];
}
- (void)myBoundsChangeNotificationHandler:(NSNotification *)aNotification
{
    if ([aNotification object] == [[self.tableView enclosingScrollView] contentView])
    {
        //[self.dataDelegate closePopover];
    }
    
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
    //[self displayActivityView];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSArray *items = [[WWDCBO sharedInstance] wwdcItemsByTrack:self.trackName];
        [self.dataDelegate setData:items];
        dispatch_async(dispatch_get_main_queue(),^
                       {
                           [self.tableView reloadData];
                           //[self hideActivityView];
                       });
        
    });
    
}


- (void)fetchFilterData:(NSString*)text
{
    //[self displayActivityView];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSArray *items = [[WWDCBO sharedInstance] wwdcItemsByFilter:text];
        [self.dataDelegate setData:items];
        dispatch_async(dispatch_get_main_queue(),^
                       {
                           [self.tableView reloadData];
                          // [self hideActivityView];
                       });
        
    });
    
}

- (void)fetchAllData
{
    //[self displayActivityView];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
         NSArray * items = [[WWDCBO sharedInstance] wwdcAllVedioItems];
        if(items.count<=0)
        {
            //[self hideActivityView];
            return ;
        }
               [self.dataDelegate setData:items];
        dispatch_async(dispatch_get_main_queue(),^
                       {
                           [self.tableView reloadData];
                           //[self hideActivityView];
                       });
        
    });
    
}

- (IBAction)openCloseDownViewAction:(id)sender;
{
    [[NSNotificationCenter defaultCenter] postNotificationName:kOpenCloseDownViewNotification object:nil];
    NSButton *btn = sender;
    btn.tag = btn.tag ? 0 : 1;
    if(btn.tag){
        btn.image = [NSImage imageNamed:@"downArrow"];
    }
    else{
         btn.image = [NSImage imageNamed:@"upArrow"];
    }
    
    [self setControllHidden:btn.tag?NO:YES];
}

- (void)setControllHidden:(NSInteger)flag
{
    [self.allCheckBox setHidden:flag];
    [self.sdCheckBox setHidden:flag];
    [self.hdCheckBox setHidden:flag];
    [self.pdfCheckBox setHidden:flag];
    [self.downButton setHidden:flag];
    [self.addDownloadButton setHidden:flag];
}

- (IBAction)addDownloadClicked:(id)sender
{
    NSArray *selectedDowntems = [self.dataDelegate selectedDowntems];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:kRequestAddDownloadNotification object:selectedDowntems];
    
    [[WWDCDownStateManager sharedInstance]addDownloads:selectedDowntems];
}
- (IBAction)downloadClicked:(id)sender
{
    NSString *downPath = [AppPreference sharedPreference].downLoadPath;
    
    [[NSFileManager defaultManager]createPathIfNeded:downPath];
    
    if(1)
    {
        [[WWDCDownStateManager sharedInstance]start];
        
        self.isStart = YES;
        
        
        //self.downButton.image = [NSImage imageNamed:@"downStop"];

    }
    else{
        //[[WWDCDownStateManager sharedInstance]stop];
        
        //self.downButton.image = [NSImage imageNamed:@"downStart2"];
        
        //self.isStart = NO;
    }
        //[[WWDCDownStateManager sharedInstance]addDownloads:selectedDowntems];
}
- (IBAction)allCheckBoxClicked:(id)sender
{
    NSButton *btn = sender;
    NSInteger state = btn.state;
    self.sdCheckBox.state = state;
    self.hdCheckBox.state = state;
    self.pdfCheckBox.state = state;
    [self.dataDelegate allCheckState:state];
    [self.tableView reloadData];
}
- (IBAction)hdCheckBoxClicked:(id)sender
{
    NSButton *btn = sender;
    NSInteger state = btn.state;
    [self updateAllCheckBoxState];
    [self.dataDelegate hdCheckState:state];
    [self.tableView reloadData];
    
}
- (IBAction)sdCheckBoxClicked:(id)sender
{
    
    NSButton *btn = sender;
    NSInteger state = btn.state;
    [self updateAllCheckBoxState];
    [self.dataDelegate sdCheckState:state];
    [self.tableView reloadData];
}
- (IBAction)pdfCheckBoxClicked:(id)sender
{
    
    NSButton *btn = sender;
    NSInteger state = btn.state;
    [self updateAllCheckBoxState];
    [self.dataDelegate pdfCheckState:state];
    [self.tableView reloadData];
}
- (void)updateAllCheckBoxState
{
    if([self totalState]>0){
        self.allCheckBox.state = 1;
    }
    else
    {
        self.allCheckBox.state = 0 ;
    }
}
- (NSInteger)totalState
{
    NSInteger sd_state = self.sdCheckBox.state;
    NSInteger hd_state = self.hdCheckBox.state;
    NSInteger pdf_state = self.pdfCheckBox.state;
    return sd_state+hd_state+pdf_state;
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

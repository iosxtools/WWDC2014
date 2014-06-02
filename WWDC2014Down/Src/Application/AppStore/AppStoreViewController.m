//
//  AppStoreViewController.m
//  WWDC2014
//
//  by @iosxtools on Twitter on 14-5-31.
//  Copyright (c) http://www.iosxtools.com. All rights reserved.
//

#import "AppStoreViewController.h"

@interface AppStoreViewController ()<ExtendedTableViewDelegate>
@property(nonatomic,strong)NSArray *images;
@end

@implementation AppStoreViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
    }
    return self;
}
- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.tableView.extendedDelegate = self;
    //[self.tableView endUpdates];
}

- (CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row;
{
    return 81.0;
}
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return 3;//[self.images count];
    
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    // Used by bindings on the NSTableCellView's objectValue
    NSDictionary *item = [self.images objectAtIndex:row];
    //[self description]
    return item;
}
#pragma click delegate
- (void)tableView:(NSTableView *)tableView didClickedRow:(NSInteger)row {
    
    [self goHomeAtRow:row];
    
}

- (IBAction)goAction:(id)sender;
{
    NSButton *button = sender;
    
    NSView *pView =button.superview;
    NSPoint aPoint = pView.superview.origin;
    NSInteger row = [self.tableView rowAtPoint: aPoint];
    [self goHomeAtRow:row];

}
- (void)goHomeAtRow:(NSInteger)row
{
    if(row==0){
        NSString *sqliteHomeUrl = @"http://www.iosxtools.com/SQLite+";
        [NSURL openURL:sqliteHomeUrl];
    }
    if(row==1){
        NSString *coreDataHomeUrl = @"http://www.iosxtools.com/CoreData+";
        [NSURL openURL:coreDataHomeUrl];
    }
    if(row==2){
        NSString *coreDataHomeUrl = @"http://www.iosxtools.com/WWDC2014";
        [NSURL openURL:coreDataHomeUrl];
    }
}
- (NSArray*)images
{
    if(!_images) {
       
        NSMutableArray *nodes = [NSMutableArray array];
        
        NSMutableDictionary *nodeMap = [NSMutableDictionary dictionary];
        nodeMap[@"name"]=@"SQLite+";
        nodeMap[@"description"]=@"SQLite+ is unique tools for iOS/OSX developers. Basic table Admin,Multi-Database Admin,Probe SQLite DataBase in Device/Simulator";
        nodeMap[@"icon"]=[NSImage imageNamed:@"SQLite_App"];
       
        
        [nodes addObject:nodeMap];
        
        
        nodeMap = [NSMutableDictionary dictionary];
        nodeMap[@"name"]=@"CoreData+";
        nodeMap[@"description"]=@"CoreData+ is probe tools for iOS/OSX developers. CoreData Data Browse/Query in your running app of Device/Simulator";
        nodeMap[@"icon"]=[NSImage imageNamed:@"CoreData_App"];
        [nodes addObject:nodeMap];
        
        
        nodeMap = [NSMutableDictionary dictionary];
        nodeMap[@"name"]=@"WWDC2014";
        nodeMap[@"description"]=@"A Cocoa OSX App to help you download WWDC2014 videos";
        nodeMap[@"icon"]=[NSImage imageNamed:@"WWDC2014_App"];
        [nodes addObject:nodeMap];
        
        _images = [nodes copy];
    }
    return _images;
}

@end

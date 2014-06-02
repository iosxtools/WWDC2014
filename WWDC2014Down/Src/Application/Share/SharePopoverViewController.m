//
//  SharePopoverViewController.m
//  CoreData+
//
//  by @iosxtools on Twitter on 14-5-14.
//  Copyright (c) 2014 http://www.iosxtools.com All rights reserved.
//

#import "SharePopoverViewController.h"
#import "SinaweiboShareWindowController.h"
#import "SharePublishWindowController.h"
#import <Social/Social.h>
#import <Accounts/Accounts.h>
@interface SharePopoverViewController ()<NSTableViewDataSource, NSTableViewDelegate,ExtendedTableViewDelegate>
@property (weak) IBOutlet HoverTableView *tableView;
@property(nonatomic,strong)NSArray *images;
@property(nonatomic,strong)SharePublishWindowController *publishShareWindowController;
@property(nonatomic,strong)ShareAccountManager *accountManager;
@end

@implementation SharePopoverViewController

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
    return 61.0;
}
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return 2;//[self.images count];
    
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    // Used by bindings on the NSTableCellView's objectValue
    NSDictionary *item = [self.images objectAtIndex:row];
    //[self description]
    return item;
}
#pragma click delegate
- (void)tableView:(NSTableView *)tableView didClickedRow:(NSInteger)row {
    if(row==0){
        if(![self.accountManager hasTwitterAccout]){
            
            NSString *info = [NSString stringWithFormat:NSLocalizedString(@"SocialAccountNil", @""), L(@"twitter")];
            [NSAlert showSheetModalForWindow:self.parentWindow message:L(@"Warning")informativeText:info
                                  alertStyle:NSWarningAlertStyle
                               okButtonTitle:L(@"Ok")
                                   onDismiss:nil
             
             ];
            return;
        }
    }
    if(row==1){
        if(![self.accountManager hasWeiboAccout]){
            
            NSString *info = [NSString stringWithFormat:NSLocalizedString(@"SocialAccountNil", @""), L(@"sinaWeibo")];
            [NSAlert showSheetModalForWindow:self.parentWindow message:L(@"Warning")informativeText:info
                                  alertStyle:NSWarningAlertStyle
                               okButtonTitle:L(@"Ok")
                                   onDismiss:nil
             
             ];
            return;
        }
    }
    if(row==2){
        if(![self.accountManager tencentWeiboAccouts]){
            
            NSString *info = [NSString stringWithFormat:NSLocalizedString(@"SocialAccountNil", @""), L(@"tencentweibo")];
            [NSAlert showSheetModalForWindow:self.parentWindow message:L(@"Warning")informativeText:info
                                  alertStyle:NSWarningAlertStyle
                               okButtonTitle:L(@"Ok")
                                   onDismiss:nil
             
             ];
            return;
        }
    }
    
    [self showPublishWindowByRowIndex:row];
}

- (void)showPublishWindowByRowIndex:(NSInteger)row
{
    NSArray *accountIdentifiers = [self.accountManager accountIdentifiers];
    XXXAssert(row<= [accountIdentifiers count]-1);
    NSString *identifier = accountIdentifiers[row];
    self.publishShareWindowController.accountIdentifier = identifier;
    [self.publishShareWindowController viewConfig];
    [self.publishShareWindowController showWindow:self];
    [self.publishShareWindowController.window center];
}
- (NSArray*)images
{
    if(!_images) {
        _images = [self.accountManager accountInfoItems];
    }
    return _images;
}


- (SharePublishWindowController*)publishShareWindowController
{
    if(!_publishShareWindowController){
        _publishShareWindowController = [[SharePublishWindowController alloc]initWithWindowNibName:@"SharePublishWindowController"];
    }
    
    return _publishShareWindowController;
}


- (ShareAccountManager*)accountManager
{
    if(!_accountManager){
        _accountManager = [ShareAccountManager sharedInstance];
    }
    return _accountManager;
}

@end

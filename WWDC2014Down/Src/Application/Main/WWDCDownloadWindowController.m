//
//  WWDCDownloadWindowController.m
//  WWDC2014
//
//  Created by @iosxtools on Twitter on 14-5-30.
//  Copyright (c) 2014 http://www.iosxtools.com All rights reserved.
//

#import "WWDCDownloadWindowController.h"

@interface WWDCDownloadWindowController ()

@end

@implementation WWDCDownloadWindowController

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    
    [self showView];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}
- (void)showView
{
    X3CommonViewController *controller =  (X3CommonViewController*)[[RouteManager sharedInstance]open:kDownloadViewVC];
    
    [self showViewController:controller];
    
}
@end

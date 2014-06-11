/*
 WWDCDetailTableViewController.h
 APPProbe
 Created by @iosxtools on Twitter on 28/05/2014 10:00PM.
 Copyright (c) http://www.iosxtools.com  All rights reserved.
 */
#import "WDCDetailTableView.h"
@interface WWDCDetailTableViewController : WWDCCommonViewController
@property (weak) IBOutlet WDCDetailTableView *wWDCDetailTableView;
@property (weak) IBOutlet NSButton *allCheckBox;
@property (weak) IBOutlet NSButton *hdCheckBox;
@property (weak) IBOutlet NSButton *sdCheckBox;
@property (weak) IBOutlet NSButton *pdfCheckBox;
@property (weak) IBOutlet NSButton *downButton;
@property (weak) IBOutlet NSButton *addDownloadButton;

- (IBAction)openCloseDownViewAction:(id)sender;
- (IBAction)downloadClicked:(id)sender;
- (IBAction)addDownloadClicked:(id)sender;
- (IBAction)allCheckBoxClicked:(id)sender;
- (IBAction)hdCheckBoxClicked:(id)sender;
- (IBAction)sdCheckBoxClicked:(id)sender;
- (IBAction)pdfCheckBoxClicked:(id)sender;
@end

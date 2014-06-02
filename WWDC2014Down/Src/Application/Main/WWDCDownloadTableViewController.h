/*
 WWDCDownloadTableViewController.h
 APPProbe
 Created by @iosxtools on Twitter on 30/05/2014 04:20AM.
 Copyright (c) http://www.iosxtools.com  All rights reserved.
 */
//#import "XXXTableViewController.h"

@interface WWDCDownloadTableViewController : WWDCCommonViewController
//@property (weak) IBOutlet NSScrollView *wWDCDownloadTableViewTableScrollView;
@property (weak) IBOutlet NSTableView *wWDCDownloadTableViewTableView;
- (IBAction)allCheckBoxClicked:(id)sender;
- (IBAction)hdCheckBoxClicked:(id)sender;
- (IBAction)sdCheckBoxClicked:(id)sender;
- (IBAction)pdfCheckBoxClicked:(id)sender;

- (IBAction)downloadClicked:(id)sender;
@end

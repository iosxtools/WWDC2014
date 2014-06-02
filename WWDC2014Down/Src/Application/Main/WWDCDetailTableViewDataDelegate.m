/*
WWDCDetailTableViewDataDelegate.m
APPProbe
Created by @iosxtools on Twitter on 28/05/2014 10:00PM.
Copyright (c) http://www.iosxtools.com  All rights reserved.
*/

#import "WWDCDetailTableViewDataDelegate.h"
#import "WWDC.h"
#define kTitleColumn    @"title"
#define kTrackColumn    @"category"
#define kPlatformColumn @"platform"
#define kLinkColumn     @"link"
@implementation WWDCDetailTableViewDataDelegate

- (void)setData:(id)data{
    assert(data);
    [super setData:data];
}


- (CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row;
{
    return 30;
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    id item = self.items[row];
    NSString *identifier = tableColumn.identifier;
    NSString *displayValue = [item valueForKey:tableColumn.identifier];
    NSView *result;
    if([identifier isEqualToString:kTitleColumn])
    {
        result =  [tableView makeViewWithIdentifier:kTitleColumn owner:self];
        NSTextField *cell = result.subviews[0];
        
        cell.stringValue = displayValue;
        
    }
    if([identifier isEqualToString:kTrackColumn])
    {
        result =  [tableView makeViewWithIdentifier:kTrackColumn owner:self];
        NSTextField *cell = result.subviews[0];
        
        cell.stringValue = displayValue;
        
    }
    if([identifier isEqualToString:kPlatformColumn])
    {
        result =  [tableView makeViewWithIdentifier:kPlatformColumn owner:self];
        NSTextField *cell = result.subviews[0];
        
        cell.stringValue = displayValue;
        
    }
    if([identifier isEqualToString:kLinkColumn])
    {
        result =  [tableView makeViewWithIdentifier:kLinkColumn owner:self];
        
        
        NSButton *hdButton = result.subviews[0];
        [hdButton setTarget: self];
        [hdButton setAction: @selector(hdBtnClicked:)];
        
        
        NSButton *sdButton = result.subviews[0];
        [sdButton setTarget: self];
        [sdButton setAction: @selector(sdBtnClicked:)];
        
        
        NSButton *pdfButton = result.subviews[0];
        [pdfButton setTarget: self];
        [pdfButton setAction: @selector(pdfBtnClicked:)];
        
        //cell.stringValue = displayValue;
        
    }
    
    return result;
    
    
}

- (IBAction)hdBtnClicked:(id)sender
{
    
    NSButton *button = (NSButton *)sender;
        //DLog(@"btnCheckboxClicked item =%d",button.state);
    NSView *pView =button.superview;
    NSPoint aPoint = pView.superview.origin;
    NSInteger row = [self.owner rowAtPoint: aPoint];
    WWDC *item = self.items[row];
    NSString *hdLink = item.hdLink;
    NSURL *url = [NSURL URLWithString:hdLink];
    if( [[NSWorkspace sharedWorkspace] openURL:url] ){
        DLog(@"Failed to open url: %@",[url description]);
    }
}


- (IBAction)sdBtnClicked:(id)sender
{
    NSButton *button = (NSButton *)sender;
    //DLog(@"btnCheckboxClicked item =%d",button.state);
    NSView *pView =button.superview;
    NSPoint aPoint = pView.superview.origin;
    NSInteger row = [self.owner rowAtPoint: aPoint];
    WWDC *item = self.items[row];
    NSString *sdLink = item.sdLink;
    NSURL *url = [NSURL URLWithString:sdLink];
    if( [[NSWorkspace sharedWorkspace] openURL:url] ){
        DLog(@"Failed to open url: %@",[url description]);
    }
}

- (IBAction)pdfBtnClicked:(id)sender
{
    NSButton *button = (NSButton *)sender;
    //DLog(@"btnCheckboxClicked item =%d",button.state);
    NSView *pView =button.superview;
    NSPoint aPoint = pView.superview.origin;
    NSInteger row = [self.owner rowAtPoint: aPoint];
    WWDC *item = self.items[row];
    NSString *pdfLink = item.pdfLink;
    NSURL *url = [NSURL URLWithString:pdfLink];
    if( [[NSWorkspace sharedWorkspace] openURL:url] ){
        DLog(@"Failed to open url: %@",[url description]);
    }
}

@end

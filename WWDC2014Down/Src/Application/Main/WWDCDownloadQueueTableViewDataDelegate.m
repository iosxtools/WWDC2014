/*
WWDCDownloadQueueTableViewDataDelegate.m
APPProbe
Created by @iosxtools on Twitter on 31/05/2014 06:02AM.
Copyright (c) http://www.iosxtools.com  All rights reserved.
*/

#import "WWDCDownloadQueueTableViewDataDelegate.h"
#import "LBProgressBar.h"
@implementation WWDCDownloadQueueTableViewDataDelegate

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
    if([identifier isEqualToString:kTypeColumn])
    {
        result =  [tableView makeViewWithIdentifier:kTypeColumn owner:self];
        NSTextField *cell = result.subviews[0];
        
        cell.stringValue = displayValue;
        
    }
    if([identifier isEqualToString:kStatusColumn])
    {
        
        double percent = [item[@"percent"] doubleValue];
        if(percent<=0)
        {
            result =  [tableView makeViewWithIdentifier:kStatusColumn owner:self];
            NSTextField *cell = result.subviews[0];
            cell.stringValue = @"Waiting...";
        }
        else if(percent>=100)
        {
            result =  [tableView makeViewWithIdentifier:kStatusColumn owner:self];
             NSTextField *cell = result.subviews[0];
            cell.stringValue = @"Complete";
        }
        else
        {
            result =  [tableView makeViewWithIdentifier:kProgressColumn owner:self];
            
            LBProgressBar *progressBar = result.subviews[0];
           
           
            [progressBar setHidden:NO];
           
            
            [progressBar setDoubleValue: percent];
        }
    
        
    }
    
    
    return result;
    
    
}
@end

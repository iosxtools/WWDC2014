/*
WWDCDownloadTableViewDataDelegate.m
APPProbe
Created by @iosxtools on Twitter on 30/05/2014 04:20AM.
Copyright (c) http://www.iosxtools.com  All rights reserved.
*/

#import "WWDCDownloadTableViewDataDelegate.h"







static WWDCVedioType vedioType(NSString *type)
{
    if([type isEqualToString:@"HD"])
    {
        return WWDCVedioHDType;
    }
    if([type isEqualToString:@"SD"])
    {
        return WWDCVedioSDType;
    }
    if([type isEqualToString:@"PDF"])
    {
        return WWDCVedioPDFType;
    }
    return -1;
}

@implementation WWDCDownloadTableViewDataDelegate

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
        
        BOOL isSelected = [item[@"isSelected"] boolValue];
        NSButton *checkButton = result.subviews[0];
        if(isSelected)
        {
            checkButton.image = [NSImage imageNamed:@"checkmark_on"];
        }
        else
        {
            checkButton.image = [NSImage imageNamed:@"checkmark_off"];
        }
        
        [checkButton setTarget: self];
        [checkButton setAction: @selector(btnCheckClicked:)];
        
        
        NSTextField *cell = result.subviews[1];
        
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
        result =  [tableView makeViewWithIdentifier:kStatusColumn owner:self];
        NSTextField *cell = result.subviews[0];
        
        cell.stringValue = displayValue;
        
    }
   
    
    return result;
    
    
}


- (IBAction)btnCheckClicked:(id)sender{
    NSButton *button = (NSButton *)sender;
    //DLog(@"btnCheckboxClicked item =%d",button.state);
    NSView *pView =button.superview;
    NSPoint aPoint = pView.superview.origin;
    NSInteger row = [self.owner rowAtPoint: aPoint];
    
    XXXAssert(row<=self.items.count-1);

    NSMutableDictionary *item = self.items[row];
    
    
    BOOL isCheck = [[item valueForKey:@"isSelected"] boolValue];
    if(!isCheck){
        button.image = [NSImage imageNamed:@"checkmark_on"];
        item[@"isSelected"] = @(1);
    }
    else{
        button.image = [NSImage imageNamed:@"checkmark_off"];
        item[@"isSelected"] = @(0);
    }
    
    
    [self.owner reloadData];
    //[self update:item];
    
    
    //DLog(@"tabelCellView node  %@",[self.owner items]);
}

/*
  bit2 bit1 bit0
  HD   SD   PDF
   0----unselected
   1----selected
*/
- (void)updateSelectItemState:(NSInteger)selectedState
{
    //BOOL hdSelected = [self selectedWithType:WWDCVedioHDType selectedState:selectedState];
    //BOOL sdSelected = [self selectedWithType:WWDCVedioHDType selectedState:selectedState];
    //BOOL pdfSelected = [self selectedWithType:WWDCVedioHDType selectedState:selectedState];
    
    for(NSMutableDictionary *item in self.items){
        NSString *displayType = item[@"type"];
        WWDCVedioType type = vedioType(displayType);
        BOOL isSelected = [self selectedWithType:type selectedState:selectedState];
        item[@"isSelected"] = @(isSelected);
    }
    
    [self.owner reloadData];
    
}

- (BOOL)selectedWithType:(WWDCVedioType)type selectedState:(NSInteger)state
{
    if(type==WWDCVedioHDType)
    {
        return state & kHDSelectState;
    }
    if(type==WWDCVedioSDType)
    {
        return state & kSDSelectState;
    }

    if(type==WWDCVedioPDFType)
    {
        return state & kPDFSelectState;
    }
    
    return NO;

}

- (NSArray*)selectedDowntems
{
    NSMutableArray *items = [NSMutableArray array];
    for(NSMutableDictionary *item in self.items){
        BOOL isSelected = [item[@"isSelected"] boolValue];
        if(isSelected)
        {
            [items addObject:item];
        }
    }
    return items;
}
@end

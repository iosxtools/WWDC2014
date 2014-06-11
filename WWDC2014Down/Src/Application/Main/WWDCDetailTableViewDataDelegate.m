/*
WWDCDetailTableViewDataDelegate.m
APPProbe
Created by @iosxtools on Twitter on 28/05/2014 10:00PM.
Copyright (c) http://www.iosxtools.com  All rights reserved.
*/

#import "WWDCDetailTableViewDataDelegate.h"
#import "WWDCTitlePopViewController.h"
#import "WWDCTitleCellView.h"
#import "WWDC.h"
#import "WWDC+Download_Selection.h"
#import "WWDCBO.h"
#define kTitleColumn    @"title"
#define kTrackColumn    @"category"
#define kPlatformColumn @"platform"
#define kLinkColumn     @"link"
#define kHDColumn       @"hd"
#define kSDColumn       @"sd"
#define kPDFColumn      @"pdf"
#define kIDColumn      @"id"


@interface WWDCDetailTableViewDataDelegate ()<WWDCTitlePopoverDelegate>
@property(nonatomic,strong)WWDCTitlePopViewController *popoverController;
@property(nonatomic,strong)NSPopover *popover;
@property(nonatomic,strong)NSImage *checkedOnImage;
@property(nonatomic,strong)NSImage *checkedOffImage;
@end

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
    WWDC *item = self.items[row];
    NSString *identifier = tableColumn.identifier;
     NSString *displayValue;
    
    if(![identifier isEqualToString:kLinkColumn])
    {
        displayValue = [item valueForKey:tableColumn.identifier];
    }
   
    NSView *result;
    if([identifier isEqualToString:kIDColumn]){
        result =  [tableView makeViewWithIdentifier:kIDColumn owner:self];
        NSTextField *cell = result.subviews[0];
        
        cell.stringValue = [NSString stringWithFormat:@"%ld",row+1];
    }
    if([identifier isEqualToString:kTitleColumn])
    {
        result =  [tableView makeViewWithIdentifier:kTitleColumn owner:self];
        
        
        WWDCTitleCellView *pView = (WWDCTitleCellView*)result;
        pView.delegate = self;
        
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
    if([identifier isEqualToString:kSDColumn])
    {
         result =  [tableView makeViewWithIdentifier:kSDColumn owner:self];
        
        NSImageView *imageView = result.subviews[0];
        if(item.sdLink.length<=0){
            [imageView setHidden:YES];
        }
        else
        {
            [imageView setHidden:NO];
        }
        if(item.isSelectedSD){
            imageView.image = self.checkedOnImage;
        }
        else{
            imageView.image = self.checkedOffImage;
        }
        
    }
    if([identifier isEqualToString:kHDColumn])
    {
        result =  [tableView makeViewWithIdentifier:kHDColumn owner:self];
        NSImageView *imageView = result.subviews[0];
        if(item.sdLink.length<=0){
            [imageView setHidden:YES];
        }
        else
        {
            [imageView setHidden:NO];
        }
        if(item.isSelectedHD){
            imageView.image = self.checkedOnImage;
        }
        else{
            imageView.image = self.checkedOffImage;
        }
        
    }
    if([identifier isEqualToString:kPDFColumn])
    {
        result =  [tableView makeViewWithIdentifier:kPDFColumn owner:self];
        NSImageView *imageView = result.subviews[0];
        if(item.sdLink<=0){
            [imageView setHidden:YES];
        }
        else
        {
             [imageView setHidden:NO];
        }
        
        if(item.isSelectedPDF){
            imageView.image = self.checkedOnImage;
        }
        else{
            imageView.image = self.checkedOffImage;
        }
        
    }
    if([identifier isEqualToString:kLinkColumn])
    {
        result =  [tableView makeViewWithIdentifier:kLinkColumn owner:self];
        
        
        NSButton *hdButton = result.subviews[0];
        [hdButton setTarget: self];
        [hdButton setAction: @selector(hdBtnClicked:)];
        
        
        NSButton *sdButton = result.subviews[1];
        [sdButton setTarget: self];
        [sdButton setAction: @selector(sdBtnClicked:)];
        
        
         NSButton *pdfButton = result.subviews[2];
        if(item.pdfLink.length>0)
        {
            [pdfButton setHidden:NO];
            [pdfButton setTarget: self];
            [pdfButton setAction: @selector(pdfBtnClicked:)];
        }
        else
        {
            [pdfButton setHidden:YES];
        }
        
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


- (WWDCTitlePopViewController*)popoverController
{
    if(!_popoverController){
        _popoverController  = [[WWDCTitlePopViewController alloc] initWithNibName:@"WWDCTitlePopViewController"   bundle:nil];
    }
    
    return _popoverController;
    
}
- (NSPopover*)popover
{
    if(!_popover){
        _popover  =  [[NSPopover alloc] init];
        _popover.behavior = NSPopoverBehaviorTransient;
        [_popover setContentSize:NSMakeSize(self.popoverController.view.width, 300.0f)];
        [_popover setContentViewController:self.popoverController];
        [_popover setAnimates:YES];
    }
    
    return _popover;
    
}

- (void)showPopover: (WWDCTitleCellView *)cell atRow:(NSInteger)rowIndex;

{
    assert(rowIndex<=(self.items.count-1));
    WWDC *obj = self.items[rowIndex];
    WWDCTitleCellView *cellRef = cell;
    [self.popoverController refreshViewWithData:obj.details];
    [self.popover showRelativeToRect: [cellRef bounds] ofView: cellRef preferredEdge: NSMaxYEdge];
    
}
- (void)closePopover:(WWDCTitleCellView *)cell atRow:(NSInteger)rowIndex;

{
    [self.popover close];
}
- (void)closePopover
{
    [self.popover close];

}
- (NSArray*)selectedDowntems
{
    NSArray *items = self.items;
    return [[WWDCBO sharedInstance]wwdcAllDownloadTableItemsFromWWDCS:items];
}
- (void)allCheckState:(NSInteger)state
{
    NSArray *items = self.items;
    for(WWDC *wwdc in items)
    {
        wwdc.isSelectedHD = state;
        wwdc.isSelectedSD = state;
        wwdc.isSelectedPDF = state;
    }
}
- (void)hdCheckState:(NSInteger)state
{
    NSArray *items = self.items;
    for(WWDC *wwdc in items)
    {
        wwdc.isSelectedHD = state;
    }
}
- (void)sdCheckState:(NSInteger)state
{
    NSArray *items = self.items;
    for(WWDC *wwdc in items)
    {
        wwdc.isSelectedSD = state;
    }
}
- (void)pdfCheckState:(NSInteger)state
{
    NSArray *items = self.items;
    for(WWDC *wwdc in items)
    {
        wwdc.isSelectedPDF = state;
    }
}


- (NSImage*)checkedOnImage
{
    if(!_checkedOnImage)
    {
        _checkedOnImage = [NSImage imageNamed:@"checked-on"];
    }
    return _checkedOnImage;
}

- (NSImage*)checkedOffImage
{
    if(!_checkedOffImage)
    {
        _checkedOffImage = [NSImage imageNamed:@"checked-off"];
    }
    return _checkedOffImage;
}

@end

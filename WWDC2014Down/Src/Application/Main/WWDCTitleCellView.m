//
//  WWDCTitleCellView.m
//  XXXARC
//
//  Created by Helens on 7/23/13.
//  Copyright (c) 2013 Helens. All rights reserved.
//

#import "WWDCTitleCellView.h"

static NSInteger activeRow;

@interface WWDCTitleCellView ()

@end

@implementation WWDCTitleCellView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}
- (void)awakeFromNib{
   
    NSTrackingArea * _trackingArea = [[NSTrackingArea alloc] initWithRect:[self bounds] options:NSTrackingMouseMoved+NSTrackingActiveInKeyWindow+NSTrackingMouseEnteredAndExited+NSTrackingActiveAlways+NSTrackingCursorUpdate owner:self userInfo:nil];
    [self addTrackingArea:_trackingArea];
    
    activeRow = -1;
    
    
}
- (void)drawRect:(NSRect)dirtyRect
{
    // Drawing code here.
}
- (void)mouseDown:(NSEvent *)theEvent{
    
    DLog(@"mouseDown");
    if([theEvent clickCount] == 2){
      
    }
    
    NSTableView *tableView = (NSTableView *)(self.superview.superview);
    NSPoint localPoint = [tableView convertPoint:theEvent.locationInWindow                fromView:nil];
    NSInteger row = [tableView rowAtPoint:localPoint];
    if(row==-1){
        return;
    }
    [self.delegate showPopover:self atRow:row];
    
}


- (void)mouseEntered:(NSEvent *)theEvent {
    DLog(@"mouseEntered");
    
    NSTableView *tableView = (NSTableView *)(self.superview.superview);
    NSPoint localPoint = [tableView convertPoint:theEvent.locationInWindow                fromView:nil];
    NSInteger row = [tableView rowAtPoint:localPoint];
    if(row==-1){
        return;
    }
    
    if(activeRow!=-1)
    {
        [self.delegate closePopover:self atRow:row];
    }
    
    activeRow = row;
    
    [self.delegate showPopover:self atRow:row];
   // [self.popover showRelativeToRect: [self bounds] ofView: self preferredEdge: NSMaxYEdge];
    
     
}
- (void)mouseExited2:(NSEvent *)theEvent {
    DLog(@"mouseExited");
   
    NSTableView *tableView = (NSTableView *)(self.superview.superview);
    NSPoint localPoint = [tableView convertPoint:theEvent.locationInWindow                fromView:nil];
    NSInteger row = [tableView rowAtPoint:localPoint];
    
    if(row==-1){
        return;
    }
    
    [self.delegate closePopover:self atRow:row];
}


@end

//
//  XXXComboBoxCell.h
//  XXXARC
//
//  Created by @iosxtools on Twitter on on 8/12/13.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface XXXComboBoxCell : NSComboBoxCell
- (id)initTextCell:(NSString *)aString;
- (void)setTitle:(NSString *)aString;
- (NSString *)title;
- (NSFont *)titleFont;
- (void)setTitleFont:(NSFont *)fontObj;
- (NSTextAlignment)titleAlignment;
- (void)setTitleAlignment:(NSTextAlignment)mode;
- (void)setTitleWidth:(float)width;
- (float)titleWidth:(NSSize)aSize;
- (float) titleWidth;
- (void)resetCursorRect:(NSRect)cellFrame inView:(NSView *)controlView;
- (void)selectWithFrame:(NSRect)aRect
                 inView:(NSView *)controlView
                 editor:(NSText *)textObj
               delegate:(id)anObject
                  start:(int)selStart
                 length:(int)selLength;
- (void)editWithFrame:(NSRect)aRect inView:(NSView *)controlView
               editor:(NSText *)textObj delegate:(id)anObject
                event:(NSEvent *)theEvent;
- (void)insertItemWithObjectValue:(id)object atIndex:(int)index;
- (void) drawLabelWithFrame:(NSRect)cellFrame inView:(NSView *)controlView;
- (void)drawWithFrame:(NSRect)cellFrame inView:(NSView *)controlView;
@end

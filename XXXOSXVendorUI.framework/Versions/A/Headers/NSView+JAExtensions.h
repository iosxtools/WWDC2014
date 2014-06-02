//
//  NSView+JAExtensions.h
//
//  Created by Josh Abernathy on 8/18/10.
//  Copyright (c) 2010 Maybe Apps. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface NSView (JAExtensions)
- (void)layoutSubviews;
- (void)layoutIfNeeded;
- (void)setNeedsLayout;

@property (nonatomic, assign) IBOutlet NSViewController *viewController;
@end

//
//  JAViewController.h
//
//  Created by Josh Abernathy on 8/17/10.
//  Copyright (c) 2010 Maybe Apps. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface JAViewController : NSViewController {

}

+ (id)viewController;

- (void)viewDidLoad;

// Called when the view has a superview and window. This does not necessarily mean the view is visible.
- (void)viewWillAppear;
- (void)viewDidAppear;

// Called when the view no longer has a superview or no longer has a window.
- (void)viewWillDisappear;
- (void)viewDidDisappear;

- (void)viewWillMoveToSuperview:(NSView *)newSuperview;
- (void)viewDidMoveToSuperview;
- (void)viewWillBeRemovedFromSuperview;
- (void)viewWasRemovedFromSuperview;

- (void)viewWillMoveToWindow:(NSWindow *)newWindow;
- (void)viewDidMoveToWindow;
- (void)viewWillBeRemovedFromWindow;
- (void)viewWasRemovedFromWindow;

@end

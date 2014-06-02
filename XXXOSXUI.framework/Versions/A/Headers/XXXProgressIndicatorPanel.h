//
//  XXXProgressIndicatorPanel.h
//  XXXOSXUI
//
//  by @iosxtools on Twitter on 14-2-7.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//
typedef void (^XXXProgressCompletionHandler)(NSInteger);
#import <Cocoa/Cocoa.h>
@interface XXXProgressIndicatorPanel : NSPanel
- (id)initWithContentRect:(NSRect)contentRect;
- (void)beginOnWindow:(NSWindow *)window completionHandler:(XXXProgressCompletionHandler)handler;
- (void)beginOnWindow:(NSWindow *)window;
- (void)endPanel;
- (void)showProgressBarIndicator;
- (void)updateIndicatorInfo:(NSString*)info;
@end

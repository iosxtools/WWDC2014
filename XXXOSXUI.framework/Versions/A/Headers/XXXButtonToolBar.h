//
//  XXXButtonToolBar.h
//  XXXARC
//
//  Created by @iosxtools on Twitter on on 8/3/13.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#import <Cocoa/Cocoa.h>


typedef enum {
    XXXButtonToolBarItemAddActionType = 0,
    XXXButtonToolBarItemRemoveActionType = 1,
    XXXButtonToolBarItemRefreshActionType = 2
} XXXButtonToolBarItemActionType;

@interface XXXButtonToolBar : NSView
@property (strong, nonatomic) id target;
@property (nonatomic) SEL action;
- (void)setUpDefaultToolbar;
- (void)setTarget:(id)target withSelector:(SEL)selector;
- (id)buttonWithIdentifier:(NSString*)identifier;
- (void)layoutToolBarItem;
- (void)setItems:(NSArray*)items;
- (void)setUpDefaultToolbarConfig;
- (void)configToolbarWithItems:(NSArray*)items;
+ (NSSize)defaultButtonSize;
- (void)updateLabelWithIdentifier:(NSString*)identifier title:(NSString*)title;
@end

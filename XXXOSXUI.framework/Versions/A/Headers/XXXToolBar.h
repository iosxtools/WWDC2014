//
//  XXXToolBar.h
//  XXXARC
//
//  Created by @iosxtools on Twitter 9/22/13.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#import <Foundation/Foundation.h>
@class  XXXToolBarItem;

typedef void(^XXXToolBarCallbackBlock)(id obj);

@interface XXXToolBar : NSObject
{
	NSWindow *window;
	NSToolbar *toolbar;
	
	NSMutableDictionary *toolbarItems;
	NSMutableArray *toolbarOrderedIdentifiers;
    
}

@property(nonatomic,strong)XXXToolBarCallbackBlock toolBarCallbackBlock;

- (id)initWithWindow:(NSWindow *)window withXml:(NSString *)pathToXmlFile;

/* Toolbar related methods */
- (void)toolbarItemClicked:(XXXToolBarItem *)item;

- (void)setToolbarDelegate:(id)delegate;
- (void)setToolbarDisplayMode:(NSToolbarDisplayMode)displayMode;
- (void)setToolbarSizeMode:(NSToolbarSizeMode)sizeMode;
- (void)setToolbarAllowsUserCustomization:(BOOL)allowsCustomization;
- (void)setToolbarAutosavesConfiguration:(BOOL)flag;
- (void)setToolbarShowsBaselineSeparator:(BOOL)flag;
- (void)setToolbarVisible:(BOOL)shown;
- (NSString *)classNameOfMessage:(NSString *)message;
@end

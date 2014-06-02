//
//  XXXFormPanel.h
//  XXXARC
//
//  Created by @iosxtools on Twitter 9/8/13.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#import "XXXPanel.h"




@interface XXXFormPanel : XXXPanel
@property(nonatomic,assign)float panelTolPadding;
@property(nonatomic,assign)float topPadding;
@property(nonatomic,assign)float leftPadding;
@property(nonatomic,assign)float rightPadding;
@property(nonatomic,assign)float bottomPadding;
@property(nonatomic,assign)float elementRowPadding;
@property(nonatomic,assign)float elementColPadding;
@property(nonatomic,assign)float buttonPadding;
@property(nonatomic,assign)float rows;
@property(nonatomic,assign)float cols;
@property(nonatomic,strong)NSMutableDictionary *dataMap;
- (void)setUpFormView;
- (void)setUpButtonView;
- (NSArray*)formElementsDef;
- (NSArray*)buttonElementsDef;
- (id)initPanelWithFrame:(NSRect)frameRect  numberOfRows:(NSInteger)rows numberOfColumns:(NSInteger)cols;
- (id)initPanelWithNumberOfRows:(NSInteger)rows numberOfColumns:(NSInteger)cols;
@end

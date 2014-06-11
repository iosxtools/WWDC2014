/*
WWDCDetailTableViewDataDelegate.h
APPProbe
Created by @iosxtools on Twitter on 28/05/2014 10:00PM.
Copyright (c) http://www.iosxtools.com  All rights reserved.
*/

//#import "XXXTableViewDataDelegate.h"

@interface WWDCDetailTableViewDataDelegate : XXXTableViewBasedDataDelegate
- (NSArray*)selectedDowntems;
- (void)closePopover;
- (void)allCheckState:(NSInteger)state;
- (void)hdCheckState:(NSInteger)state;
- (void)sdCheckState:(NSInteger)state;
- (void)pdfCheckState:(NSInteger)state;
@end


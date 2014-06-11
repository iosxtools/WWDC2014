//
//  NSTabView+Extension.h
//  XXXARC
//
//  Created by @iosxtools on Twitter on on 8/3/13.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#import <Cocoa/Cocoa.h>
@interface NSTabView (Extension)
- (void)removeAllTabs;
- (void)setTabColumnsDef:(NSArray*)tabDefs;
- (NSArray*)tableViewColumnsWithNames:(NSArray*)tableNames;
@end

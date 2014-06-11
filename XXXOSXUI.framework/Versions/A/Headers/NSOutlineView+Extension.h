//
//  NSOutlineView+Extension.h
//  XXXARC
//
//  Created by @iosxtools on Twitter on on 8/4/13.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSOutlineView (Extension)
- (void)removeAllColumns;
- (void)updateColumnsDef:(NSArray*)columnsDef;
- (void)resizeColumns;
- (NSArray*)itemsAtIndexSet:(NSIndexSet*)indexSet;
@end

//
//  NSTableView+Extension.h
//  XXXARC
//
//  Created by @iosxtools on Twitter on on 8/2/13.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSTableView (Extension)
- (void)removeAllColumns;
- (void)updateColumnsDef:(NSArray*)columnsDef;
- (void)updateWithColumnNames:(NSArray*)names;
- (void)resizeColumns;
- (void)setEditFoucusAtColumn:(int)columnIndex;
- (void)setLostEditFoucus;
@end

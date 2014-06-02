//
//  NSTableColumn+Define.h
//  XXXARC
//
//  Created by @iosxtools on Twitter on on 7/31/13.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "XXXNSTableColumnField.h"
@interface NSTableColumn (Define)
+ (id)tableColumnWithDef:(XXXNSTableColumnField*)def;
- (void)updateColumnWithDef:(XXXNSTableColumnField*)def;
@end

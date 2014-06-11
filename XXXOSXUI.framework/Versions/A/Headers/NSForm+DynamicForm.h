//
//  NSForm+DynamicForm.h
//  XXXARC
//
//  Created by @iosxtools on Twitter on on 8/12/13.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSForm (DynamicForm)
+ (NSForm*)defaultFormWithRowNums:(int)nums;
- (void)updateWithData:(id)data;
@end

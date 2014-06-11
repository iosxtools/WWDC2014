//
//  NSMatrix+DynamicForm.h
//  XXXARC
//
//  Created by @iosxtools on Twitter on on 8/11/13.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSMatrix (DynamicForm)
+ (NSMatrix*)defaultFormWithRowNums:(int)nums;
- (void)updateWithData:(id)data;
@end

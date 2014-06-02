//
//  NSObject+JAExtensions.h
//
//  Created by Josh Abernathy on 8/18/10.
//  Copyright (c) 2010 Maybe Apps. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface NSObject (JAExtensions)
+ (void)swapMethod:(SEL)originalSelector with:(SEL)newSelector;
@end

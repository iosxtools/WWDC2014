//
//  NSString-NULL.h
//  WingLetter
//
//  Created by javaliker on 10-9-23.
//  Copyright 2010 Wingletter. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString (NSString_NULL)

- (id)initWithUTF8NULLString:(const char *)nullTerminatedCString;

@end

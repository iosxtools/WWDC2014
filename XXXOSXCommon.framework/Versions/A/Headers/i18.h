//
//  i18.h
//  iOSXHelperDemo
//
//  Created by @iosxtools on Twitter on on 4/17/13.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//
static inline NSString * L(NSString * key) { return [[NSBundle mainBundle] localizedStringForKey:(key) value:@"" table:nil]; }


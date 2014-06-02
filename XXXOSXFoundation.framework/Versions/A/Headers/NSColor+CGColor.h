//
//  NSColor+CGColor.m
//
//  Created by Michael Sanders on 11/19/10.
//

#import <AppKit/AppKit.h>

@interface NSColor (CGColor)

+ (NSColor*)colorWithHexColorString:(NSString*)inColorString;
- (NSString *)colorHexString;
@end
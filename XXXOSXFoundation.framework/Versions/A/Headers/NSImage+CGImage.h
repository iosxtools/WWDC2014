//
//  NSImage+CGImage.h
//  XXXARC
//
//  Created by @iosxtools on Twitter on on 6/22/13.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#import <Cocoa/Cocoa.h>
@interface NSImage (CGImage)
- (CGImageRef)CGImage;
- (CIImage*)ciImage;
+ (NSImage*)imageFromCGImageRef:(CGImageRef)image;
@end

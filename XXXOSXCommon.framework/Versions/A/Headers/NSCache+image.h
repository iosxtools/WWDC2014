//
//  NSCache+image.h
//  XXXARC
//
//  Created by @iosxtools on Twitter on on 6/22/13.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSCache (image)
- (NSImage*)hImage;
- (NSImage*)mImage;
- (NSImage*)folderImage;
- (NSImage*)imageImage;
- (NSImage*)uiviewImage;
- (NSImage*)imageNamed:(NSString*)name;
@end

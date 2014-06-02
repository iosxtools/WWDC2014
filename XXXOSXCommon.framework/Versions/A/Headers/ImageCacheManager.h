//
//  ImageCacheManager.h
//  XXXARC
//
//  Created by @iosxtools on Twitter on on 6/22/13.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageCacheManager : NSCache
+ (ImageCacheManager *) sharedImageCacheManager;
@end

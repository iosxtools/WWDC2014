//
//  NSDictionary+safeSetValueForKey.h
//  XXXARC
//
//  Created by @iosxtools on Twitter on on 7/25/13.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (safeSetValueForKey)
- (void)setSafeValue:(id)value forKey:(NSString*)key;
@end

//
//  DataBaseBO.h
//  WWDC2014Down
//
//  by @iosxtools on Twitter on 14-3-26.
//  Copyright (c) http://www.iosxtools.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataBaseBO : NSObject
+ (DataBaseBO*)sharedInstance;
- (BOOL)openDataBase;
- (void)closeDataBase;
@end

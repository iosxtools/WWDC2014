//
//  XXXTablePageControll.h
//  XXXOSXCommon
//
//  by @iosxtools on Twitter on 14-5-4.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#import <Foundation/Foundation.h>
@class XXXPageManager;
@interface XXXTablePageControll : NSObject
@property(nonatomic,strong)XXXPageManager *pageManager;
@property(nonatomic,assign)NSInteger tabIndex;
@end

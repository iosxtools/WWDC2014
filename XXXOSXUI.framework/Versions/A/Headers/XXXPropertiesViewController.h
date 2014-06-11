//
//  XXXPropertiesViewController.h
//  XXXARC
//
//  Created by @iosxtools on Twitter on on 8/11/13.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#import "XXXCommonViewController.h"
@class XXXPropertiesView;
@interface XXXPropertiesViewController : XXXCommonViewController
@property(nonatomic,strong)XXXPropertiesView *propertiesView;
@property(nonatomic,strong)NSScrollView *propertiesViewScrollView;
- (void)propertiesViewConfig;
@end



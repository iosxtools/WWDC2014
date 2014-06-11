//
//  XXXPropertiesDataSource.h
//  XXXARC
//
//  Created by @iosxtools on Twitter on on 8/11/13.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XXXPropertiesView.h"
@interface XXXPropertiesViewDataDelegate : NSObject<XXXPropertiesViewDataSource>
@property(nonatomic,strong)NSMutableDictionary *groupNodes;
@property(nonatomic,strong)NSMutableArray *groupMembers;
- (void)setData:(id)data;
@end

//
//  BonjourNetWorkManager.h
//  XXXARC
//
//  Created by @iosxtools on Twitter on on 7/5/13.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BonjourNetWorkManager : NSObject
@property(nonatomic,strong)NSString *bonjourHttpTcpType;
@property(nonatomic,strong)NSString *domain;
+ (BonjourNetWorkManager*)sharedBonjourNetWorkManager;
- (NSString*)findClientNetURLString:(NSString*)appID;
- (void)start;
- (void)stop;
@end

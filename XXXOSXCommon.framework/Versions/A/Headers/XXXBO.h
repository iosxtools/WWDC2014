//
//  XXXBO.h
//  XXXARC
//
//  Created by @iosxtools on Twitter on on 8/7/13.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#import <Foundation/Foundation.h>
@class XXXDAO;
@interface XXXBO : NSObject
@property(nonatomic,readonly)XXXDAO *dao;
+ (instancetype)sharedInstance;
- (BOOL)save:(id)obj;
- (BOOL)delete:(id)obj;
- (NSArray*)allDefines;
- (NSArray*)all;
- (void)configDAOClass:(Class)daoClass;
@end


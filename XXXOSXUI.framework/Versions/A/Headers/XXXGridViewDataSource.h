//
//  XXXGridViewDataSource.h
//  XXXARC
//
//  Created by @iosxtools on Twitter on on 8/20/13.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#import <Foundation/Foundation.h>
@interface XXXGridViewDataSource : NSObject
@property(nonatomic,strong,readonly)NSMutableArray *contents;
- (void)updateContentsWithData:(NSArray*)datas;
- (void)addItemToContent:(id)itemData;
- (void)reomoveContentAtIndex:(NSInteger)index;
@end

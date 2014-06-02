//
//  XXXComboBoxItemsConfig.h
//  XXXARC
//
//  Created by @iosxtools on Twitter on on 8/19/13.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#import <Foundation/Foundation.h>
extern NSString * const XXXTableViewControllerBaseClass;
extern NSString * const XXXTableViewDelegateBaseClass;
extern NSString * const XXXTableViewColumnHeaderAlignmentType;
extern NSString * const XXXTableViewColumnDataAlignmentType;
extern NSString * const XXXTableViewColumnCellType;

@interface XXXTablePropertiesItemsConfig : NSObject
+ (NSArray*)itemsForIdentitifer:(NSString *)keyPath;
@end

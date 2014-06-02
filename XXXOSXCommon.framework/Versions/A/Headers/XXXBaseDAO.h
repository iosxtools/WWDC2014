//
//  XXXBaseDAO.h
//  
//
//  Created by  test on 10-4-13.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "XXXDBManager.h"
#import <objc/runtime.h>
#import "XXXDAO.h"
@interface XXXBaseDAO : XXXDAO
@property(nonatomic,readonly)NSInteger count;/*numbers of record in table*/
@property(nonatomic,copy)NSString  *tableName;/*table name*/
@property(nonatomic,retain)NSArray *fldList;/*all coulumn list*/
@property(nonatomic,retain)NSArray *keyList;/*primary key coulumn list*/
@property(nonatomic,retain)NSArray *fldExcludeKeyList;/*coulumn list */

@end

//
//  DBManager.h
//  fmdb-migration-manager
//
//  Created by song jun on 10/27/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//
#import "SynthesizeSingleton.h"
@interface DBManager : NSObject
@property(nonatomic,retain)FMDatabase *db;
@property (nonatomic,retain)FMDatabaseQueue *queue;
@property(nonatomic,retain)NSString   *dbName;
+ (DBManager *) sharedDBManager;
- (BOOL)openDataBase:(NSString*)dataBase;
- (void)closeDataBase;
@end

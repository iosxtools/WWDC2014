//
//  XXXDBManager.h
//  fmdb-migration-manager
//
//  Created by song jun on 10/27/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//
@interface XXXDBManager : NSObject
@property (nonatomic,strong)FMDatabaseQueue *queue;
@property(nonatomic,strong)NSString   *dbName;
+ (XXXDBManager *) sharedXXXDBManager;
- (BOOL)openDataBaseWithName:(NSString*)dbName;
- (BOOL)openDataBaseWithPath:(NSString*)path;
- (BOOL)createNewDatabase;
- (void)closeDataBase;
@end
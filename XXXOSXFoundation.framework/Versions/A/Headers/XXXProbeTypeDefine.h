//
//  XXXProbeTypeDefine.h
//  XXXProbeOSX
//
//  by @iosxtools on Twitter on 14-4-22.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#define  SQLiteHTTPServiceCodeBase  0

typedef NS_ENUM (NSInteger,SQLiteHTTPServiceType)
{
    
    SQLiteDataBaseListType            =       SQLiteHTTPServiceCodeBase+1,
    SQLiteDataBaseTablesType          =       SQLiteHTTPServiceCodeBase+2,
    SQLiteDataBaseTableType           =       SQLiteHTTPServiceCodeBase+3,
    SQLiteDataBaseSQLType             =       SQLiteHTTPServiceCodeBase+4
    
};

#define  SQLiteDataBaseTypeValid(type)  ((type>=SQLiteDataBaseListType && type<=SQLiteDataBaseSQLType))


#define  CoreDataHTTPServiceCodeBase  100
typedef NS_ENUM (NSInteger,CoreDataHTTPServiceType)
{
    
    CoreDataModelsType                =       CoreDataHTTPServiceCodeBase+1,
    CoreDataEntitiesType              =       CoreDataHTTPServiceCodeBase+2,
    CoreDataFetchType                 =       CoreDataHTTPServiceCodeBase+3,
    CoreDataCURDType                  =       CoreDataHTTPServiceCodeBase+4,
    CoreDataDataCountType             =       CoreDataHTTPServiceCodeBase+5
    
    
};
#define  CoreDataTypeValid(type)  ((type>=CoreDataModelsType && type<=CoreDataCURDType))


#define  kCoreData_OP_ClearAll      @"ClearAll"
#define  kCoreData_OP_Add           @"Add"
#define  kCoreData_OP_Remove        @"Remove"
#define  kCoreData_OP_Update        @"Update"
#define  kCoreData_OP_Magic         @"Magic"




typedef NS_ENUM (NSInteger,XXXProbeType)
{
    XXXProbeUnknownType               =       0,
    XXXProbeSQLiteType                =       1,
    XXXProbeCoreDataType              =       2
};





#ifndef  kSQLiteProbeAPIBaseURL

/*#define  kSQLiteProbeAPIBaseURL          @"/probe/sqlite"
 #define  kSQLiteProbeDataBasePath        @"/probe/sqlite/database"
 #define  kSQLiteProbeDataBaseTablesPath  @"/probe/sqlite/database/tables"
 #define  kSQLiteProbeDataBaseTablePath   @"/probe/sqlite/database/table"
 #define  kSQLiteProbeSQLExecutePath      @"/probe/sqlite/database/sql"
 */


#define  kSQLiteProbeAPIBaseURL          @"/probe/sqlite"
#define  kSQLiteProbeDataBasePath        XXXIntToStr(SQLiteDataBaseListType)
#define  kSQLiteProbeDataBaseTablesPath  XXXIntToStr(SQLiteDataBaseTablesType)
#define  kSQLiteProbeDataBaseTablePath   XXXIntToStr(SQLiteDataBaseTableType)
#define  kSQLiteProbeSQLExecutePath      XXXIntToStr(SQLiteDataBaseSQLType)


#define  kCoreDataProbeModelsPath        XXXIntToStr(CoreDataModelsType)
#define  kCoreDataProbeEntitesPath       XXXIntToStr(CoreDataEntitiesType)
#define  kCoreDataProbeFetchPath         XXXIntToStr(CoreDataFetchType)
#define  kCoreDataProbeGURDPath          XXXIntToStr(CoreDataCURDType)
#define  kCoreDataProbeDataCountPath     XXXIntToStr(CoreDataDataCountType)




#endif
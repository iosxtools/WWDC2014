//
//  DataBaseBO.m
//  WWDC2014Down
//
//  by @iosxtools on Twitter on 14-3-26.
//  Copyright (c) http://www.iosxtools.com. All rights reserved.
//

#import "DataBaseBO.h"



static inline NSString * appDBPath() {
    NSString *appDocPath = [FileManager appPath];
    NSString *path =[appDocPath stringByAppendingPathComponent:kAppDBName];
    return path;
}
@implementation DataBaseBO
+ (DataBaseBO*)sharedInstance
{
    static DataBaseBO *instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
    });
    
    return instance;
}
- (BOOL)openDataBase
{
    NSString *dbPath = appDBPath();
    BOOL isOpen = [[XXXDBManager sharedXXXDBManager]openDataBaseWithPath:dbPath];
    return isOpen;
}
- (void)closeDataBase
{
    [[XXXDBManager sharedXXXDBManager]closeDataBase];
}

@end

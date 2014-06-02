//
//  FileManager.h
//  GeniusTools
//
//  Created by @iosxtools on Twitter on on 5/27/13.
//
//
#import <Foundation/Foundation.h>
@interface FileManager : NSObject
@property(nonatomic,retain)NSArray *searchFileType;
- (NSArray *)imageFilesAtDirectory:(NSString *)directoryPath;
- (NSArray *)imageFilePathAtFolder:(NSString *)directoryPath;
- (NSArray *)imageFilePathAtFolder:(NSString *)directoryPath groupKey:(NSString *)key;
- (NSArray *)unusedImageFilesAtDirectory:(NSString *)directoryPath;
- (BOOL)isValidImageAtPath:(NSString *)imagePath;
+ (FileManager*)sharedFileManager;
+ (NSString*)appPath;
+ (NSString*)userDocumentPath;
+ (NSString*)jsonCachePath;
+ (BOOL)fileExistsAtPath:(NSString *)path;
- (NSArray *)findObjcHeaderFilesAtPaths:(NSArray*)paths framePrefix:(NSString*)framePrefix;
+ (void)clearAllFilesAtPath:(NSString*)path;
@end

//
//  NSFileManager+Extension.h
//  XXXTest
//
//  Created by @iosxtools on Twitter on on 6/3/13.
//
//

#import <Foundation/Foundation.h>

@interface NSFileManager (Extension)
- (NSString*)readFileByPath:(NSString*)path;
- (NSArray*)readFilesAtPath:(NSString*)path;
- (NSArray*)readFoldersAtPath:(NSString*)path;
- (BOOL)isFolderAtPath:(NSString*)path;
- (BOOL)isFileAtPath:(NSString*)path;
- (void)createFolder:(NSString*)folederName;
- (void)createPathIfNeded:(NSString*)path;
- (BOOL)createFileIfNeeded:(NSString*)filePath;
+ (NSDictionary*)readPlistFilesAtPath:(NSString*)path;
- (long long)fileSizeForPath:(NSString *)path;
+ (NSString*)appPath;
+ (NSString*)userDocumentPath;
+ (BOOL)fileExistsAtPath:(NSString *)path;
@end

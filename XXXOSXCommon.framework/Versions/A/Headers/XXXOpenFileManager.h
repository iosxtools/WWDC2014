//
//  XXXOpenFileManager.h
//  XXXARC
//
//  Created by @iosxtools on Twitter 10/19/13.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^filePanelCallback)(id path);

@interface XXXOpenFileManager : NSObject
@property(nonatomic,strong)NSArray *fileTypes;
@property(nonatomic,assign)BOOL allowsMultipleSelection;
@property(nonatomic,assign)BOOL canChooseFiles;
@property(nonatomic,assign)BOOL canChooseDirectories;

@property(nonatomic,strong)NSString  *saveTitle;
@property(nonatomic,strong)NSString  *saveMessage;
@property(nonatomic,strong)NSArray   *saveFileExtensions;

@property(nonatomic,copy)filePanelCallback   openCallback;
@property(nonatomic,copy)filePanelCallback   saveCallback;
- (void)showOpenPanel;
- (void)showSavePanel;
@end

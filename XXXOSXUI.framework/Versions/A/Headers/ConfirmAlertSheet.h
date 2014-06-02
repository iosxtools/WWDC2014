//
//  ConfirmAlertSheet.h
//  iOSXHelper
//
//  Created by @iosxtools on Twitter on on 3/28/13.
//
//
#define kRenameTableMode     (NSUInteger)1 
#define kDuplicateTableMode  (NSUInteger)2 
#import <Foundation/Foundation.h>
#import "PRHSheet.h"
@interface ConfirmAlertSheet : PRHSheet {
}
@property (assign) IBOutlet NSTextField *titleTextFld;
@property (assign) IBOutlet NSTextField *contentTextFld;
@property (assign) IBOutlet NSButton *cancleBtn;
@property (assign) IBOutlet NSButton *okBtn;
@property (assign) NSUInteger  bizMode;
- (IBAction) ok:(id)sender;
- (IBAction) cancel:(id)sender;
@end

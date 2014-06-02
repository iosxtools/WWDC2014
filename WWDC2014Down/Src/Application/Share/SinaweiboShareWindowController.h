//
//  SinaweiboShareWindowController.h
//  WWDC2014Down
//
//  by @iosxtools on Twitter on 14-2-13.
//  Copyright (c) http://www.iosxtools.com. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@interface SinaweiboShareWindowController : NSWindowController
@property (unsafe_unretained) IBOutlet NSTextView *shareContent;
@property (weak) IBOutlet NSTextField *accountNameLable;
- (IBAction)shareAction:(id)sender;
- (IBAction)attachAction:(id)sender;
@end

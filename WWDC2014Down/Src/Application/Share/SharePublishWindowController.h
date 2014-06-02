//
//  SharePublishWindowController.h
//  WWDC2014Down
//
//  by @iosxtools on Twitter on 14-2-15.
//  Copyright (c) http://www.iosxtools.com. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface SharePublishWindowController : NSWindowController
@property(nonatomic,strong)NSString *accountIdentifier;
@property (unsafe_unretained) IBOutlet NSTextView *shareContent;
@property (weak) IBOutlet NSImageView *accountImageView;
@property (weak) IBOutlet NSTextField *accountNameLable;
- (IBAction)shareAction:(id)sender;
- (IBAction)attachAction:(id)sender;
- (void)viewConfig;
@end

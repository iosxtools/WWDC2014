//
//  FeedbackPanel.h
//  WWDC2014Down
//
//  by @iosxtools on Twitter on 14-2-27.
//  Copyright (c) http://www.iosxtools.com. All rights reserved.
//

#import <XXXOSXUI/XXXOSXUI.h>

@interface FeedbackPanel : XXXPanel
@property (weak) IBOutlet NSTextField *titleTextField;
@property (weak) IBOutlet NSTextField *emailTextField;
@property (weak) IBOutlet NSTextField *infoLabel;
@property (unsafe_unretained) IBOutlet NSTextView *detailTextView;
- (IBAction) ok:(id)sender;
- (IBAction) cancel:(id)sender;
@end

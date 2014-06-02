//
//  FeedbackPanel.m
//  WWDC2014Down
//
//  by @iosxtools on Twitter on 14-2-27.
//  Copyright (c) http://www.iosxtools.com. All rights reserved.
//

#import "FeedbackPanel.h"




@interface FeedbackPanel ()

@end

@implementation FeedbackPanel
- (void)clearData
{
    self.infoLabel.stringValue = @"";
}
- (IBAction) ok:(id)sender {
    NSString *title = self.titleTextField.stringValue;
    if(!title || title.length<=0){
        return;
    }
    NSString *email = self.emailTextField.stringValue;
    if(!email || email.length<=0){
        return;
    }
    if(![email isValidEmail]){
        self.infoLabel.textColor = [NSColor redColor];
        self.infoLabel.stringValue = L(@"invalidEmail");
        return;
    }
    NSString *details = self.detailTextView.string;
    if(!details || details.length<=0){
        return;
    }
    
    //[self postFeedback];
    
	[self endWithReturnCode:NSOKButton];
}
- (void)postFeedback
{
    
   
    
    
}
- (IBAction) cancel:(id)sender {
	[self endWithReturnCode:NSCancelButton];
}

@end

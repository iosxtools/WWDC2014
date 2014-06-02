//
//  SettingsWindowController.h
//  WWDC2014Down
//
//  Created by Helens on 2/27/13.
//
//

#import <Cocoa/Cocoa.h>

@interface SettingsWindowController : NSWindowController<NSTextViewDelegate>{
    
    IBOutlet NSTextField *projectTextFld;
    
    IBOutlet NSTextField *authorTextFld;
    
    IBOutlet NSTextField *rootPathTextFld;
        
    NSString  *projectString;
    IBOutlet NSTextField *pageSizeTextField;
   
    IBOutlet NSStepper *pageSizeStepper;
}
@property(nonatomic,unsafe_unretained)NSWindow  *parentWindow;
@property (assign) IBOutlet NSTextView *projectTemplateFld;
- (IBAction)doRepath:(id)sender;
- (IBAction)doClearCode:(id)sender;
- (IBAction)doPageSizeStepper:(id)sender;
@end

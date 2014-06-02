//
//  SettingsWindowController.m
//  WWDC2014Down
//
//  Created by Helens on 2/27/13.
//
//

#import "SettingsWindowController.h"
@interface SettingsWindowController ()

@end

@implementation SettingsWindowController
- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}
- (void)awakeFromNib
{ 
    
    rootPathTextFld.stringValue = [AppPreference sharedPreference].downLoadPath;
        
  
    
   
}




- (void)controlTextDidChange:(NSNotification *)notification {
    NSTextField *textField = [notification object];
    
  
    
   
    //DLog(@"controlTextDidChange: stringValue == %@", [textField stringValue]);
    

}
- (IBAction)doRepath:(id)sender {
    
    // Loop counter.
    
    // Create a File Open Dialog class.
    NSOpenPanel* openDlg = [NSOpenPanel openPanel];
    
    // Set array of file types
    NSArray *fileTypesArray;
    fileTypesArray = [NSArray arrayWithObjects:@"db", @"sqlite", nil];
    
    // Enable options in the dialog.
    [openDlg setCanChooseDirectories:YES];
    //[openDlg setAllowedFileTypes:fileTypesArray];
    [openDlg setAllowsMultipleSelection:NO];
    
    // Display the dialog box.  If the OK pressed,
    // process the files.
    if ( [openDlg runModal] == NSOKButton ) {
        
        // Gets list of all files selected
        NSArray *files = [openDlg URLs];
        
        // Loop through the files and process them.
        for(NSInteger i = 0; i < [files count]; i++ ) {
            
            // Do something with the filename.
            NSLog(@"File path: %@", [[files objectAtIndex:i] path]);
            NSString *path = [[files objectAtIndex:i] path];
            
            rootPathTextFld.stringValue = path;
            
            [AppPreference sharedPreference].downLoadPath = path;
            
           
        }
        
    }
    
}


- (void)close{
    

    [AppPreference sharedPreference].downLoadPath = rootPathTextFld.stringValue;
    
    [super close];
}

- (void)windowWillClose:(NSNotification *)note {

    [AppPreference sharedPreference].downLoadPath = rootPathTextFld.stringValue;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

@end

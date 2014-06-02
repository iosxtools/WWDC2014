#import <Foundation/Foundation.h>

typedef void (^DismissBlock)(int buttonIndex);
typedef void (^CancelBlock)();

@interface NSAlert (Blocks)
+ (NSAlert*) showSheetModalForWindow:(NSWindow*) window
                             message:(NSString*) message
                     informativeText:(NSString*) text
                          alertStyle:(NSAlertStyle) style
                       okButtonTitle:(NSString*) okButtonTitle
                           onDismiss:(DismissBlock) dismissed;
+ (NSAlert*)showSheetModalForWindow:(NSWindow*) window
										  message:(NSString*) message
								informativeText:(NSString*) text
									  alertStyle:(NSAlertStyle) style
							 cancelButtonTitle:(NSString*) cancelButtonTitle
							 otherButtonTitles:(NSArray*) otherButtons
										onDismiss:(DismissBlock) dismissed
										 onCancel:(CancelBlock) cancelled;

@end
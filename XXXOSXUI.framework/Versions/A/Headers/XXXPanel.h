//
//  XXXPanel.h
//  XXXARC
//
//  Created by @iosxtools on Twitter 9/8/13.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#import <Cocoa/Cocoa.h>
typedef void (^XXXPanelCompletionHandler)(NSInteger);

@interface XXXPanel : NSPanel<NSTextFieldDelegate,NSTextDelegate,NSComboBoxDelegate>{
    
}
@property(nonatomic,strong)NSButton *cancelBtn;
@property(nonatomic,strong)NSButton *okBtn;
@property(nonatomic,strong)NSMutableArray *requireValidateItemIditifiers;
@property(nonatomic,copy)XXXPanelCompletionHandler handler;
@property(nonatomic,strong)NSMutableDictionary *elementsMap;
- (id)initWithContentRect:(NSRect)contentRect;
- (void) beginOnWindow:(NSWindow *)window completionHandler:(XXXPanelCompletionHandler)handler;
- (void) beginOnWindow:(NSWindow *)window completionHandler:(XXXPanelCompletionHandler)handler autoExitWindow:(BOOL)autoExitWindow;
- (void) end;
- (void) endWithReturnCode:(NSInteger)returnCode;

- (IBAction) ok:(id)sender;
- (IBAction) cancel:(id)sender;
- (void)clearData;



- (void)updateWithData:(id)data;
- (void)setBindObj:(id)bindToObj;
- (NSDictionary*)bindDataMap;
- (void)registerTransformer:(NSValueTransformer*)transformer forBindingKeyPath:(NSString*)keyPath;
- (NSValueTransformer*)transformerForBindingKeyPath:(NSString*)keyPath;
- (id)bindObj;
- (void)changedNotify;
- (void)changedNotify:(NSView *)element;
- (NSView*)elementByIdentifier:(NSString*)identifier;
- (BOOL)validateElement:(NSView *)element;
- (BOOL)validate;
@end

//Returns nil if the return code isn't recognized.
extern NSString *XXXPanelStringForReturnCode(NSInteger returnCode);
//Returns @"???" if the return code isn't recognized.
extern NSString *XXXPanelDebugStringForReturnCode(NSInteger returnCode);
//Returns a given string if the return code isn't recognized.
extern NSString *XXXPanelStringForReturnCodeWithDefault(NSInteger returnCode, NSString *defaultString);


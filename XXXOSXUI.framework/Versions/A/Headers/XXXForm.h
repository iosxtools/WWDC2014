//
//  XXXForm.h
//  XXXARC
//
//  Created by @iosxtools on Twitter on on 8/13/13.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface XXXForm : NSView<NSTextFieldDelegate,NSTextDelegate,NSComboBoxDelegate>
+ (id)defaultFormWithRowNums:(NSInteger)nums;
+ (id)defaultFormWithRowNums:(NSInteger)nums withBindObj:(id)bindObj;
- (void)updateWithData:(id)data;
- (void)setBindObj:(id)bindToObj;
- (NSDictionary*)bindDataMap;
- (id)itemOfIdentifier:(NSString*)identifier;
- (id)itemAtRowIndex:(NSInteger)index;
- (void)registerTransformer:(NSValueTransformer*)transformer forBindingKeyPath:(NSString*)keyPath;
- (NSValueTransformer*)transformerForBindingKeyPath:(NSString*)keyPath;
- (id)bindObj;
- (void)changedNotify;
@end

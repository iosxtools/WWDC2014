//
//  WWDCTitleCellView.h
//  XXXARC
//
//  Created by Helens on 7/23/13.
//  Copyright (c) 2013 Helens. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@protocol WWDCTitlePopoverDelegate;
@interface WWDCTitleCellView : NSTableCellView
@property(nonatomic,weak)id<WWDCTitlePopoverDelegate>delegate;
@end

@protocol WWDCTitlePopoverDelegate <NSObject>
- (void)showPopover: (WWDCTitleCellView *)cell atRow:(NSInteger)rowIndex;
- (void)closePopover:(WWDCTitleCellView *)cell atRow:(NSInteger)rowIndex;

@end
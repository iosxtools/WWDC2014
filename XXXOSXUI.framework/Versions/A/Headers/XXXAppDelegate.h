//
//  XXXAppDelegate.h
//  WWDC2014Down
//
//  by @iosxtools on Twitter on 14-5-24.
//  Copyright (c) 2014 http://www.iosxtools.com All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XXXAppDelegate : NSObject <NSApplicationDelegate>
@property(nonatomic,strong)NSString *currentViewIdentifier;
- (IBAction)defaultToolBarItemClick:(id)sender;
- (void)displayActivityView;
- (void)hideActivityView;
@end

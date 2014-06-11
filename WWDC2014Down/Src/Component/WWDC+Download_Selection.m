//
//  WWDC+Download_Selection.m
//  WWDCDown
//
//  Created by @iosxtools on Twitter on 14-6-10.
//  Copyright (c) 2014年 http://www.iosxtools.com. All rights reserved.
//

#import "WWDC+Download_Selection.h"
#import <objc/runtime.h>
@implementation WWDC (Download_Selection)

static char kAssociatedSelectedHDObjectKey;
static char kAssociatedSelectedSDObjectKey;
static char kAssociatedSelectedPDFObjectKey;

- (void)setIsSelectedHD:(BOOL)flag
{
    objc_setAssociatedObject(self, &kAssociatedSelectedHDObjectKey, @(flag),
                             OBJC_ASSOCIATION_RETAIN);
}

- (BOOL)isSelectedHD
{
    NSNumber *v = objc_getAssociatedObject(self, &kAssociatedSelectedHDObjectKey);
    
    return [v boolValue];
}

- (void)setIsSelectedSD:(BOOL)flag
{
    objc_setAssociatedObject(self, &kAssociatedSelectedSDObjectKey, @(flag),
                             OBJC_ASSOCIATION_RETAIN);
}

- (BOOL)isSelectedSD
{
    NSNumber *v = objc_getAssociatedObject(self, &kAssociatedSelectedSDObjectKey);
    
    return [v boolValue];
}



- (void)setIsSelectedPDF:(BOOL)flag
{
    objc_setAssociatedObject(self, &kAssociatedSelectedPDFObjectKey, @(flag),
                             OBJC_ASSOCIATION_RETAIN);
}

- (BOOL)isSelectedPDF
{
    NSNumber *v = objc_getAssociatedObject(self, &kAssociatedSelectedPDFObjectKey);
    
    return [v boolValue];
}

- (BOOL)downSelected
{
    if(self.isSelectedPDF || self.isSelectedHD || self.isSelectedSD)
    {
            return YES;
    }
    return NO;

}

@end

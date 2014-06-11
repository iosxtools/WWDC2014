//
//  XXXCommonMacro.h
//  XXXOSXFoundation
//
//  Created by @iosxtools on Twitter 11/21/13.
//  Copyright (c) http://www.iosxtools.com All rights reserved.
//
#ifndef XXXOSXFoundation_XXXCommonMacro_h
#define XXXOSXFoundation_XXXCommonMacro_h

#define XXXDEBUG
#ifdef XXXDEBUG
#       define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#       define DLog(...)
#endif


#define  XXXIntToStr(number)   [@(number) stringValue]


#define DLOGThreadState NSLog((@"%s [Line %d]Current NSThread State = %d" ), __PRETTY_FUNCTION__, __LINE__,[NSThread currentThread].isMainThread);

#define XXXAssert(expression, ...) \
do { if(!(expression)) { \
DLog(@"%@", [NSString stringWithFormat: @"XXXAssertion failure: %s in %s on line %s:%d. %@", #expression, __PRETTY_FUNCTION__, __FILE__, __LINE__, [NSString stringWithFormat:@"" __VA_ARGS__]]); \
abort(); }} while(0)

// 本地化转换
#define L2(key) [[NSBundle mainBundle] localizedStringForKey:(key) value:@"" table:nil]



#define IsStrEmpty(_ref)    (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) ||([(_ref)isEqualToString:@""]))



#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)





#define NSViewSizableAllMargin    (1+2+4+8+16+32)
#define NSViewSizableMargin       (1+4+8+32)


#endif

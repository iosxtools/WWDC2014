//
//  NSObject+Description.h
//  iOSXHelper
//
//  Created by @iosxtools on Twitter on on 5/18/13.
//
//
typedef enum DescriptionStyle {
    DescriptionStyleDefault,
    DescriptionStyleMultiLine,
    DescriptionStyleNoNames,
    DescriptionStyleShortPrefix,
    DescriptionStyleSimple,
} DescriptionStyle;
#import <Foundation/Foundation.h>
@interface NSObject (NSObject_Description)
- (NSString *)description2;
- (NSString *)reflectDescription;
- (NSString *)reflectDescription:(id)obj style:(DescriptionStyle)style;
@end




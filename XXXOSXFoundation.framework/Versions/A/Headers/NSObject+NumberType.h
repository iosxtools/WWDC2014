//
//  NSObject+NumberType.h
//  iOSXHelper
//
//  Created by @iosxtools on Twitter on on 3/22/13.
//
//

enum XNumberType	// popup tag choices
{
	kDataTypeString = 0,
	kDataypeInt,
    kDataypeShort,
    kDataypeLong,
	kDataypeFloat,
    kDataypeDouble,
    kDataypeBoolean,
    kDataypeUnknow,
};

typedef enum XNumberType XNumberType;


#import <Foundation/Foundation.h>


@interface NSObject (NSObject_NumberType)

- (XNumberType)NumberType;
- (NSString*)numberString;


@end

//
//  NSString_SEL.h
//  Deblock
//
//  Created by Maarten Billemont on 06/10/09.
//  Copyright 2009 lhunath (Maarten Billemont). All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString (NSString_SEL)

- (BOOL)isGetter;
- (BOOL)isSetter;

- (NSString *)getterToSetter;
- (NSString *)setterToGetter;

@end

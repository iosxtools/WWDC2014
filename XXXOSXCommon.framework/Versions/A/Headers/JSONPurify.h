//
//  JSONPurify.h
//  iOSXHelper
//
//  Created by javaliker on 2/2/13.
//  Copyright (c) 2013 javaliker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSONPurify : NSObject{
    NSString *gap,*indent;
}

@property(nonatomic,copy) NSString *gap;
+ (JSONPurify *) sharedJSONPurify;
- (NSString *)str:(NSString *)key hoder:(id)hoder;
- (NSString *)stringify:(NSString *)jsonStr spaceNum:(int)spaceNum;
- (NSString *)quote:(NSString *)string;
- (NSString *)quoteNum:(NSNumber *)num;

- (NSString*)purify:(NSString*)string;
- (NSString *)pretty:(id)obj;
@end

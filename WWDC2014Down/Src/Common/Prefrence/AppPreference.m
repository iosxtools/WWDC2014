//
//  AppPreference.m
//  WWDC2014Down
//
//  by @iosxtools on Twitter on 14-5-24.
//  Copyright (c) 2014 http://www.iosxtools.com All rights reserved.
//

#import "AppPreference.h"

@implementation AppPreference


@dynamic downLoadPath;


-(id)init2{
    self = [super init];
    if(self){
        
        //_proTypeEncodingCache = [NSMutableDictionary dictionary];
    }
	return self;
}
+ (AppPreference *)sharedPreference;
{
    static AppPreference *instace = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        instace = [[super alloc] init];
        NSDictionary *data = [instace defaultKVDataConfig];
        if(data){
            [instace registerFromDictionary:data];
        }
       
    });
    return instace;
}
- (NSDictionary*)defaultKVDataConfig{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectoryPath = [paths objectAtIndex:0];
    NSString * downLoadPath = [documentsDirectoryPath stringByAppendingPathComponent:@"WWDC2014/Download"];
    
   
    
    return @{
             @"downLoadPath":downLoadPath,
             @"projectName":@"project",
             @"authorName":@"author"
             
             };
}

@end
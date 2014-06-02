/*
 WWDCDownload.m
 project
 Created by author on 31/05/2014 10:15AM.
 Copyright (c) 2014 author. All rights reserved.
 */
#import "WWDCDownload.h"
#import "WWDCDownloadDAO.h"
@interface WWDCDownload()
@property(nonatomic,strong)WWDCDownloadDAO *dao;
@end
@implementation WWDCDownload
/*init property member var by parsing NSDictionary parameter*/
- (id)initWithDictionary:(NSDictionary *)dictionary{
	if ((self = [super init]) && (dictionary))
	{
        id value ;
        value = dictionary[@"ID"];
        if(value) _ID = [value longValue];  

        value = dictionary[@"wwdcID"];
        if(value) _wwdcID = [value longValue];  

        value = dictionary[@"type"];
        if(value) _type = [value longValue];  

        value = dictionary[@"status"];
        if(value) _status = [value longValue];  

  
    }
    return self;  
}               
- (id)initWithCoder:(NSCoder *)coder{
	if ((self = [super init]))
	{
    	if ([coder allowsKeyedCoding])
	    {
            _ID = [coder decodeIntegerForKey:@"ID"];
            _wwdcID = [coder decodeIntegerForKey:@"wwdcID"];
            _type = [coder decodeIntegerForKey:@"type"];
            _status = [coder decodeIntegerForKey:@"status"];
        }
        else
        {
            _ID = [[coder decodeObject]longValue];
            _wwdcID = [[coder decodeObject]longValue];
            _type = [[coder decodeObject]longValue];
            _status = [[coder decodeObject]longValue];
        
        }
    }
    return self;
}
- (void)encodeWithCoder:(NSCoder *)coder {
	if ([coder allowsKeyedCoding])
	{
        [coder encodeInt64:_ID forKey:@"ID"];
        [coder encodeInt64:_wwdcID forKey:@"wwdcID"];
        [coder encodeInt64:_type forKey:@"type"];
        [coder encodeInt64:_status forKey:@"status"];
    }
    else
    {
        [coder encodeValueOfObjCType:@encode(long) at:&_ID];
        [coder encodeValueOfObjCType:@encode(long) at:&_wwdcID];
        [coder encodeValueOfObjCType:@encode(long) at:&_type];
        [coder encodeValueOfObjCType:@encode(long) at:&_status];
    
    }
}
- (BOOL)isEqual:(WWDCDownload *)obj {
    if(![obj isKindOfClass:WWDCDownload.class])
    { 
        return NO;
    }
    return (self.ID==obj.ID)
    && (self.wwdcID==obj.wwdcID)
    && (self.type==obj.type)
    && (self.status==obj.status)
    ;
}
- (NSDictionary*)JSONKeyPathsByPropertyKey
{
    return nil;
}
-(BOOL) allowsKeyedCoding
{
    /*[self setValuesForKeysWithDictionary:jsonObject];*/
	return YES;
}
- (id)valueForUndefinedKey:(NSString *)key
{
    // subclass implementation should provide correct key value mappings for custom keys
    NSLog(@"Undefined Key: %@", key);
    return nil;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    // subclass implementation should set the correct key value mappings for custom keys
    NSLog(@"Undefined Key: %@", key);
}

- (WWDCDownloadDAO*)dao
{
    if(!_dao)
    {
        _dao = [[WWDCDownloadDAO alloc]init];
    }
    return _dao;
}

- (BOOL)save
{
    return [self.dao insert:self];
}

- (BOOL)update
{
     return [self.dao update:self];
}

- (BOOL)delete
{
     return [self.dao delete:self];
}

@end

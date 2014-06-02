/*
 WWDC.m
 project
 Created by author on 28/05/2014 10:57PM.
 Copyright (c) 2014 author. All rights reserved.
 */
#import "WWDC.h"
#import "WWDCDAO.h"
@interface WWDC()
@property(nonatomic,strong)WWDCDAO *dao;
@end
@implementation WWDC
/*init property member var by parsing NSDictionary parameter*/
- (id)initWithDictionary:(NSDictionary *)dictionary{
	if ((self = [super init]) && (dictionary))
	{
        id value ;
        value = dictionary[@"ID"];
        if(value) _ID = [value longValue];  

        value = dictionary[@"wwdcYear"];
        if(value) _wwdcYear = value;  

        value = dictionary[@"title"];
        if(value) _title = value;  

        value = dictionary[@"category"];
        if(value) _category = value;  

        value = dictionary[@"platform"];
        if(value) _platform = value;  

        value = dictionary[@"hdLink"];
        if(value) _hdLink = value;  

        value = dictionary[@"sdLink"];
        if(value) _sdLink = value;  

        value = dictionary[@"pdfLink"];
        if(value) _pdfLink = value;  

        value = dictionary[@"desc"];
        if(value) _desc = value;  

        value = dictionary[@"sortOrder"];
        if(value) _sortOrder = [value longValue];  

  
    }
    return self;  
}               
- (id)initWithCoder:(NSCoder *)coder{
	if ((self = [super init]))
	{
    	if ([coder allowsKeyedCoding])
	    {
            _ID = [coder decodeIntegerForKey:@"ID"];
            _wwdcYear = [coder decodeObjectForKey:@"wwdcYear"];  
            _title = [coder decodeObjectForKey:@"title"];  
            _category = [coder decodeObjectForKey:@"category"];  
            _platform = [coder decodeObjectForKey:@"platform"];  
            _hdLink = [coder decodeObjectForKey:@"hdLink"];  
            _sdLink = [coder decodeObjectForKey:@"sdLink"];  
            _pdfLink = [coder decodeObjectForKey:@"pdfLink"];  
            _desc = [coder decodeObjectForKey:@"desc"];  
            _sortOrder = [coder decodeIntegerForKey:@"sortOrder"];
        }
        else
        {
            _ID = [[coder decodeObject]longValue];
            _wwdcYear = [coder decodeObject];  
            _title = [coder decodeObject];  
            _category = [coder decodeObject];  
            _platform = [coder decodeObject];  
            _hdLink = [coder decodeObject];  
            _sdLink = [coder decodeObject];  
            _pdfLink = [coder decodeObject];  
            _desc = [coder decodeObject];  
            _sortOrder = [[coder decodeObject]longValue];
        
        }
    }
    return self;
}
- (void)encodeWithCoder:(NSCoder *)coder {
	if ([coder allowsKeyedCoding])
	{
        [coder encodeInt64:_ID forKey:@"ID"];
        if(_wwdcYear) [coder encodeObject:_wwdcYear forKey:@"wwdcYear"];
        if(_title) [coder encodeObject:_title forKey:@"title"];
        if(_category) [coder encodeObject:_category forKey:@"category"];
        if(_platform) [coder encodeObject:_platform forKey:@"platform"];
        if(_hdLink) [coder encodeObject:_hdLink forKey:@"hdLink"];
        if(_sdLink) [coder encodeObject:_sdLink forKey:@"sdLink"];
        if(_pdfLink) [coder encodeObject:_pdfLink forKey:@"pdfLink"];
        if(_desc) [coder encodeObject:_desc forKey:@"desc"];
        [coder encodeInt64:_sortOrder forKey:@"sortOrder"];
    }
    else
    {
        [coder encodeValueOfObjCType:@encode(long) at:&_ID];
        if(_wwdcYear) [coder encodeObject:_wwdcYear];
        if(_title) [coder encodeObject:_title];
        if(_category) [coder encodeObject:_category];
        if(_platform) [coder encodeObject:_platform];
        if(_hdLink) [coder encodeObject:_hdLink];
        if(_sdLink) [coder encodeObject:_sdLink];
        if(_pdfLink) [coder encodeObject:_pdfLink];
        if(_desc) [coder encodeObject:_desc];
        [coder encodeValueOfObjCType:@encode(long) at:&_sortOrder];
    
    }
}
- (BOOL)isEqual:(WWDC *)obj {
    if(![obj isKindOfClass:WWDC.class])
    { 
        return NO;
    }
    return (self.ID==obj.ID)
    && ([self.wwdcYear isEqual:obj.wwdcYear])
    && ([self.title isEqual:obj.title])
    && ([self.category isEqual:obj.category])
    && ([self.platform isEqual:obj.platform])
    && ([self.hdLink isEqual:obj.hdLink])
    && ([self.sdLink isEqual:obj.sdLink])
    && ([self.pdfLink isEqual:obj.pdfLink])
    && ([self.desc isEqual:obj.desc])
    && (self.sortOrder==obj.sortOrder)
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

- (WWDCDAO*)dao
{
    if(!_dao)
    {
        _dao = [[WWDCDAO alloc]init];
    }
    return _dao;
}

- (BOOL)save
{
    NSArray *rs = [self.dao findByAttributes:@{@"title":self.title}];
    if([rs count]<=0)
    {
        return [self.dao insert:self];
    }
    return YES;
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

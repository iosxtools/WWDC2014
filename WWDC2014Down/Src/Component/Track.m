/*
 Track.m
 project
 Created by author on 29/05/2014 02:24AM.
 Copyright (c) 2014 author. All rights reserved.
 */
#import "Track.h"
#import "TrackDAO.h"
@interface Track()
@property(nonatomic,strong)TrackDAO *dao;
@end
@implementation Track
/*init property member var by parsing NSDictionary parameter*/
- (id)initWithDictionary:(NSDictionary *)dictionary{
	if ((self = [super init]) && (dictionary))
	{
        id value ;
        value = dictionary[@"ID"];
        if(value) _ID = [value longValue];  

        value = dictionary[@"name"];
        if(value) _name = value;  

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
            _name = [coder decodeObjectForKey:@"name"];  
            _sortOrder = [coder decodeIntegerForKey:@"sortOrder"];
        }
        else
        {
            _ID = [[coder decodeObject]longValue];
            _name = [coder decodeObject];  
            _sortOrder = [[coder decodeObject]longValue];
        
        }
    }
    return self;
}
- (void)encodeWithCoder:(NSCoder *)coder {
	if ([coder allowsKeyedCoding])
	{
        [coder encodeInt64:_ID forKey:@"ID"];
        if(_name) [coder encodeObject:_name forKey:@"name"];
        [coder encodeInt64:_sortOrder forKey:@"sortOrder"];
    }
    else
    {
        [coder encodeValueOfObjCType:@encode(long) at:&_ID];
        if(_name) [coder encodeObject:_name];
        [coder encodeValueOfObjCType:@encode(long) at:&_sortOrder];
    
    }
}
- (BOOL)isEqual:(Track *)obj {
    if(![obj isKindOfClass:Track.class])
    { 
        return NO;
    }
    return (self.ID==obj.ID)
    && ([self.name isEqual:obj.name])
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

- (TrackDAO*)dao
{
    if(!_dao)
    {
        _dao = [[TrackDAO alloc]init];
    }
    return _dao;
}

- (BOOL)save
{
    NSArray *rs = [self.dao findByAttributes:@{@"name":self.name}];
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

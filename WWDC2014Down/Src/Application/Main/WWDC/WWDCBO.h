//
//  WWDCBO.h
//  WWDC2014Down
//
//  Created by @iosxtools on Twitter on 14-5-28.
//  Copyright (c) 2014 http://www.iosxtools.com All rights reserved.
//

#import <Foundation/Foundation.h>
@class WWDC;
@interface WWDCBO : XXXBO
- (void)clearAll;
- (void)parseWWDCDownloadLink;
- (NSArray*)categoryTreeNodes:(NSArray*)cateModels;
- (NSArray*)wwdcItemsByTrack:(NSString*)trackName;
- (NSArray*)wwdcItemsByFilter:(NSString*)filter;
- (NSArray*)wwdcAllVedioItems;
- (NSArray*)wwdcAllDownloadItems;
- (NSArray*)wwdcAllDownloadTableItems;
- (WWDC*)wwdcWithID:(NSInteger)ID;
@end

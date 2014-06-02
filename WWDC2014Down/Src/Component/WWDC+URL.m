//
//  WWDC+URL.m
//  WWDC2014
//
//  by @iosxtools on Twitter on 14-5-31.
//  Copyright (c) http://www.iosxtools.com. All rights reserved.
//

#import "WWDC+URL.h"

@implementation WWDC (URL)
- (NSString*)urlWithType:(WWDCVedioType)type
{
    switch (type) {
        case WWDCVedioHDType:
            return self.hdLink;
            break;
        case WWDCVedioSDType:
            return self.sdLink;
            break;
        case WWDCVedioPDFType:
            return self.pdfLink;
            break;
        default:
            break;
    }
    
    return nil;
}
@end

//
//  WWDCTitlePopViewController.m
//  WWDCDown
//
//  Created by @iosxtools on Twitter on 14-6-9.
//  Copyright (c) 2014年 http://www.iosxtools.com. All rights reserved.
//

#import "WWDCTitlePopViewController.h"

@interface WWDCTitlePopViewController ()

@end

@implementation WWDCTitlePopViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
    }
    return self;
}
- (void)refreshViewWithData:(id)obj
{
    if([obj isKindOfClass:[NSString class]])
    {
        if(obj){
            
            NSAttributedString *attributedString = [self titleAttributeFormat:obj ];
            
            
            NSTextStorage *store = [self.titleTextView textStorage];
            [store setAttributedString:attributedString];

             //self.titleTextView.attributedString = attributedString;
        }
    }
}

- (NSAttributedString*)titleAttributeFormat:(NSString*)formatString;
{
    if(!formatString){
        return nil;
    }

    NSMutableAttributedString *attriString = [[NSMutableAttributedString alloc] initWithString:formatString];
    
   
    
    CTFontRef helveticaBold = CTFontCreateWithName(CFSTR("Helvetica"), 15.0, NULL);
    
    [attriString addAttribute:(NSFontAttributeName)
                        value:(__bridge_transfer NSFont*)(helveticaBold)
                        range:NSMakeRange(0, formatString.length)];
    
    return attriString;
}

@end

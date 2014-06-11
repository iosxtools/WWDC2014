//
//  WWDCCommonViewController.m
//  WWDC2014
//
//  Created by @iosxtools on Twitter on 14-5-29.
//  Copyright (c) 2014 http://www.iosxtools.com All rights reserved.
//

#import "WWDCCommonViewController.h"

@interface WWDCCommonViewController ()
@property(nonatomic,strong)NSProgressIndicator *progressIndicator;
@end

@implementation WWDCCommonViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
    }
    return self;
}



#pragma activity
#pragma activityView
- (void)displayActivityView;
{
    [self.progressIndicator setHidden:NO];
    [self.progressIndicator startAnimation:self];
}
- (void)hideActivityView;
{
    [self.progressIndicator setHidden:YES];
    [self.progressIndicator stopAnimation:self];
}
- (NSProgressIndicator*)progressIndicator
{
    if(!_progressIndicator){
        _progressIndicator = [[NSProgressIndicator alloc] initWithFrame:NSMakeRect(0.0f, 0.0f, 40.0f, 40.0f)];
        NSView *view = self.view;
        [view addSubview:_progressIndicator];
        _progressIndicator.top = (view.height-_progressIndicator.height)/2;
        _progressIndicator.left = (view.width-_progressIndicator.width)/2;
        [_progressIndicator setStyle:NSProgressIndicatorSpinningStyle];
        [_progressIndicator setIndeterminate:YES];
        [_progressIndicator setMinValue:0];
        [_progressIndicator setMaxValue:100];
        [_progressIndicator setDoubleValue:25];
        [_progressIndicator setHidden:YES];
    }
    return _progressIndicator;
}

@end

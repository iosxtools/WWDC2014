/*
 WWDCDetailViewController.m
 APPProbe
 Created by @iosxtools on Twitter 09/06/2014 10:06AM.
 Copyright (c) http://www.iosxtools.com. All rights reserved.
 */

#import "WWDCDetailViewController.h"
#import "WWDCDetailTableViewController.h"
#import "WWDCDownloadQueueTableViewController.h"
@interface WWDCDetailViewController ()
@property(nonatomic,strong)WWDCDetailTableViewController *wWDCDetailTableViewController;
@property(nonatomic,strong)WWDCDownloadQueueTableViewController *wWDCDownloadQueueTableViewController;

@property(nonatomic,strong)NSView *targetView1;
@property(nonatomic,strong)NSView *targetView2;
@property(nonatomic,assign)NSRect targetView1LastFrame;
@property(nonatomic,assign)NSRect targetView2LastFrame;
@end

@implementation WWDCDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    return [super initWithNibName:nil bundle:nil];
}
- (void)awakeFromNib{
    [super awakeFromNib];
    [self registerSlideNotify];
    [self collapseViewConfig];
    [self toggleMainView];
}

- (void)registerSlideNotify
{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(recvOpenMainSlideNotification:) name:kOpenCloseDownViewNotification object:nil];
    
    
    
    //[[NSNotificationCenter defaultCenter]addObserver:kOpenMainSlideNotification selector:@selector(recvOpenMainSlideNotification:) object:nil];
}

#pragma collapseView config
- (void)collapseViewConfig
{
    NSArray *subviews = [self.splitView subviews];
    self.targetView1 = subviews[0];
    self.targetView2 =  subviews[1];
    //self.targetView1LastFrame = self.targetView1.frame;
    //self.targetView2LastFrame = self.targetView2.frame;
}

- (void)recvOpenMainSlideNotification:(NSNotification*)notification
{
    [self toggleMainView];
}

- (void)toggleMainView
{
    if ([self.splitView isSubviewCollapsed:self.targetView2]) {
        // NSSplitView hides the collapsed subview
       
        
        NSMutableDictionary *target1AnimationDict = [NSMutableDictionary dictionaryWithCapacity:2];
        [target1AnimationDict setObject:self.targetView1 forKey:NSViewAnimationTargetKey];
        
        self.targetView1.height = self.targetView1LastFrame.size.height;
        self.targetView1.top = 0;
        
        [target1AnimationDict setObject:[NSValue valueWithRect:self.targetView1LastFrame] forKey:NSViewAnimationEndFrameKey];
        
        NSMutableDictionary *target2AnimationDict = [NSMutableDictionary dictionaryWithCapacity:2];
        [target2AnimationDict setObject:self.targetView2 forKey:NSViewAnimationTargetKey];
        
        //NSRect newMainFrame  =
        self.targetView2.top = self.splitView.height-self.targetView1.height;
        self.targetView2.height = self.self.targetView2LastFrame.size.height;
        //self.targetView2.frame = self.targetView2LastFrame;
        //self.targetView2LastFrame = self.targetView2.frame;
        
        [target2AnimationDict setObject:[NSValue valueWithRect:self.targetView2LastFrame] forKey:NSViewAnimationEndFrameKey];
        
        NSViewAnimation *expandAnimation = [[NSViewAnimation alloc] initWithViewAnimations:[NSArray arrayWithObjects:target1AnimationDict, target2AnimationDict, nil]];
        [expandAnimation setDuration:0.25f];
        [expandAnimation startAnimation];
        
         self.targetView2.hidden = NO;
        
    } else {
        // Store last width so we can jump back
        
        self.targetView1LastFrame = self.targetView1.frame;
        
        self.targetView2LastFrame = self.targetView2.frame;
        
        NSMutableDictionary *target1AnimationDict = [NSMutableDictionary dictionaryWithCapacity:2];
        [target1AnimationDict setObject:self.targetView1 forKey:NSViewAnimationTargetKey];
        NSRect newMainFrame = self.targetView1.frame;
        newMainFrame.size.height =  self.splitView.height;
        //newMainFrame.origin.y = 0;
        [target1AnimationDict setObject:[NSValue valueWithRect:newMainFrame] forKey:NSViewAnimationEndFrameKey];
        
        NSMutableDictionary *target2AnimationDict = [NSMutableDictionary dictionaryWithCapacity:2];
        [target2AnimationDict setObject:self.targetView2 forKey:NSViewAnimationTargetKey];
        NSRect newInspectorFrame = self.targetView2.frame;
        newInspectorFrame.size.height = 0.0f;
        //self.targetView2.hidden = YES;
        //newInspectorFrame.origin.y = self.splitView.height;
        [target2AnimationDict setObject:[NSValue valueWithRect:newInspectorFrame] forKey:NSViewAnimationEndFrameKey];
        
        NSViewAnimation *collapseAnimation = [[NSViewAnimation alloc] initWithViewAnimations:[NSArray arrayWithObjects:target1AnimationDict, target2AnimationDict, nil]];
        [collapseAnimation setDuration:0.25f];
        [collapseAnimation startAnimation];
    }
}

- (BOOL)splitView:(NSSplitView *)splitView canCollapseSubview:(NSView *)subview {
    BOOL result = NO;
    if (splitView == self.splitView && subview == self.targetView2) {
        result = YES;
    }
    return result;
}

- (BOOL)splitView:(NSSplitView *)splitView shouldCollapseSubview:(NSView *)subview forDoubleClickOnDividerAtIndex:(NSInteger)dividerIndex {
    BOOL result = NO;
    if (splitView == self.splitView && subview == self.targetView2) {
        result = YES;
    }
    return result;
}


- (void)splitViewControllersConfig{
    self.controllers = @[self.wWDCDetailTableViewController,self.wWDCDownloadQueueTableViewController];
}
- (void)splitViewSizeConfig{
    [self.splitView setVertical:NO];
    [self.splitView setPosition:self.view.height/2 ofDividerAtIndex:0];
}
- (WWDCDetailTableViewController*)wWDCDetailTableViewController{
    if(!_wWDCDetailTableViewController){
        _wWDCDetailTableViewController = [[WWDCDetailTableViewController alloc]initWithNibName:@"WWDCDetailTableViewController" bundle:nil];
        _wWDCDetailTableViewController.parentWindow = self.parentWindow;
    }
    return _wWDCDetailTableViewController;
}
- (WWDCDownloadQueueTableViewController*)wWDCDownloadQueueTableViewController{
    if(!_wWDCDownloadQueueTableViewController){
        _wWDCDownloadQueueTableViewController = [[WWDCDownloadQueueTableViewController alloc]initWithNibName:@"WWDCDownloadQueueTableViewController" bundle:nil];
        _wWDCDownloadQueueTableViewController.parentWindow = self.parentWindow;
    }
    return _wWDCDownloadQueueTableViewController;
}

@end

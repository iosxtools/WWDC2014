//
//  SharePublishWindowController.m
//  WWDC2014Down
//
//  by @iosxtools on Twitter on 14-2-15.
//  Copyright (c) http://www.iosxtools.com. All rights reserved.
//

#import "SharePublishWindowController.h"
#import <Social/Social.h>
#import <Accounts/Accounts.h>
#import "CNUserNotification.h"
@interface SharePublishWindowController ()<CNUserNotificationCenterDelegate>
@property(nonatomic,assign)BOOL hasAttachPictures;
@property(nonatomic,strong)NSMutableArray *pictures;
@property(nonatomic,strong)XXXOpenFileManager *openFileManager;
@property (strong) CNUserNotificationCenter *notificationCenter;
@end

@implementation SharePublishWindowController

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    
    self.notificationCenter = [CNUserNotificationCenter defaultUserNotificationCenter];
	self.notificationCenter.delegate = self;
    

    //[self deliverButtonAction:nil];
    
    
    NSArray *accouts = [[ShareAccountManager sharedInstance]accountWithIdentifier:self.accountIdentifier];
    if(!accouts || accouts.count<=0){
        return;
    }
    ACAccount *account = accouts[0];
    
    self.accountNameLable.stringValue = account.accountDescription;
}

- (IBAction)deliverButtonAction:(id)sender detailInfo:(NSString*)detailInfo {
	CNUserNotification *notification = [CNUserNotification new];
	notification.title = L(@"notice");
	//notification.subtitle = @"self.subtitle.stringValue";
	notification.informativeText = L(detailInfo);
	notification.hasActionButton =  YES ;
	notification.actionButtonTitle = @"Ok";
	notification.feature.dismissDelayTime = 2;
	//notification.feature.bannerImage = self.bannerImagePreview.image;
	notification.feature.lineBreakMode = NSLineBreakByTruncatingTail;
	//notification.soundName = (self.playNotificationSoundCheckbox.state == NSOnState ? CNUserNotificationDefaultSound : nil);
	notification.userInfo = @{ @"openThisURLBecauseItsAwesome": @""};
    
	[self.notificationCenter deliverNotification:notification];
}
- (void)viewConfig
{
    _hasAttachPictures = NO;
    _pictures = nil;
    NSDictionary *accountInfoItem = [[ShareAccountManager sharedInstance] accountInfoItemWithIdentifier:self.accountIdentifier];
    if(accountInfoItem){
        NSString *title = accountInfoItem[kShareNameKey];
        NSImage *image =accountInfoItem[kShareIconKey];
        if(title){
            self.accountNameLable.stringValue = title;
        }
        if(image){
            self.accountImageView.image = image;
        }
    }
}
- (IBAction)shareAction:(id)sender;
{
    NSString *content = self.shareContent.string;
    if(!content){
        return;
    }
    if([self.accountIdentifier isEqualToString:ACAccountTypeIdentifierFacebook]){
        [self fackbookPublish];
    }
    if([self.accountIdentifier isEqualToString:ACAccountTypeIdentifierTwitter]){
        [self twitterPublish];
    }
    if([self.accountIdentifier isEqualToString:ACAccountTypeIdentifierSinaWeibo]){
        [self sinaweiboPublish];
    }
    if([self.accountIdentifier isEqualToString:ACAccountTypeIdentifierTencentWeibo]){
        [self tencentweiboPublish];
    }
    
}
- (IBAction)attachAction:(id)sender;
{
    if(!self.openFileManager.openCallback){
        __weak __typeof(&*self)weakSelf = self;
        self.openFileManager.openCallback = ^(id paths){
            __strong __typeof(&*weakSelf)strongSelf = weakSelf;
            if (!strongSelf) {
                return;
            }
            NSArray *filePaths ;
            if([paths isKindOfClass:[NSString class]]){
                filePaths = @[paths];
            }
            else{
                filePaths = paths;
            }
            for(NSString *path in filePaths)
            {
                NSString *fileName = [path lastPathComponent];
                NSImage *image = [[NSImage alloc] initWithContentsOfFile: path];
                
                NSBitmapImageRep *imgRep = [[image representations] objectAtIndex: 0];
                NSData *imageData = [imgRep representationUsingType: NSPNGFileType properties: nil];
                
                NSDictionary *pic = @{@"filename":fileName,
                        @"data":imageData
                                      
                                      };
                if(!strongSelf.pictures){
                    strongSelf.pictures = [NSMutableArray array];
                }
                [strongSelf.pictures addObject:pic];
                strongSelf.hasAttachPictures = YES;
                
            }
            DLog(@"paths=%@",paths)
        };
    }
    [self.openFileManager showOpenPanel];
}

- (void)fackbookPublish
{
    NSArray *accouts = [[ShareAccountManager sharedInstance]accountWithIdentifier:self.accountIdentifier];
    if(!accouts || accouts.count<=0){
        return;
    }
    ACAccount *account = accouts[0];
    NSURL *url;
    if(self.hasAttachPictures){
        url = [NSURL URLWithString:@"https://upload.api.weibo.com/2/statuses/upload.json"];
    }
    else{
        url = [NSURL URLWithString:@"https://graph.facebook.com/me/feed"];
    }
    
    NSString *content = self.shareContent.string;
    
    NSDictionary *para = @{@"message":content};
    SLRequest *request = [SLRequest requestForServiceType:SLServiceTypeSinaWeibo requestMethod:SLRequestMethodPOST URL:url parameters:para];
    if(self.hasAttachPictures){
        for(NSDictionary *pic in self.pictures){
            NSString *filename =  pic[@"filename"];
            NSData *data = pic[@"data"];
            [request addMultipartData:data withName:@"pic" type:@"multipart/form-data" filename:filename];
        }
    }
    
    //装载微博用户
    request.account = account;
    //发送微博
    [request performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error)
     {
         if (!error)
         {
             //主线程中操作UI
             dispatch_async(dispatch_get_main_queue(), ^{
                 NSString *response = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
                 NSLog(@"请求结果:%@",response);
                 //操作UI
                 
                 [self deliverButtonAction:nil detailInfo:@"shareFacebookOk"];
                 
                 [self close];
             });
         }
     }];
    
}
- (void)twitterPublish
{
    NSArray *accouts = [[ShareAccountManager sharedInstance]accountWithIdentifier:self.accountIdentifier];
    if(!accouts || accouts.count<=0){
        return;
    }
    ACAccount *account = accouts[0];
    NSURL *url;
    if(self.hasAttachPictures){
        url = [NSURL URLWithString:@"https://api.twitter.com/1.1/statuses/update_with_media.json"];
    }
    else{
        url = [NSURL URLWithString:@"https://api.twitter.com/1.1/statuses/update.json"];
    }
    
    NSString *content = self.shareContent.string;
    
    NSDictionary *para = @{@"status":content};
    SLRequest *request = [SLRequest requestForServiceType:SLServiceTypeTwitter requestMethod:SLRequestMethodPOST URL:url parameters:para];
    if(self.hasAttachPictures){
        for(NSDictionary *pic in self.pictures){
            NSString *filename =  pic[@"filename"];
            NSData *data = pic[@"data"];
            [request addMultipartData:data withName:@"media[]" type:@"image/jpeg" filename:filename];
        }
    }
    
    //装载微博用户
    request.account = account;
    //发送微博
    [request performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error)
     {
         if (!error)
         {
             //主线程中操作UI
             dispatch_async(dispatch_get_main_queue(), ^{
                 
                 
                 
                 if (responseData) {
                     
                     if (urlResponse.statusCode >= 200 &&
                         
                         urlResponse.statusCode < 300) {
                         
                         
                         
                         NSError *jsonError;
                         
                         NSDictionary *timelineData =
                         
                         [NSJSONSerialization
                          
                          JSONObjectWithData:responseData
                          
                          options:NSJSONReadingAllowFragments error:&jsonError];
                         
                         if (timelineData) {
                             
                             NSLog(@"Timeline Response: %@\n", timelineData);
                             
                         }
                         
                         else {
                             
                             // Our JSON deserialization went awry
                             
                             NSLog(@"JSON Error: %@", [jsonError localizedDescription]);
                             
                         }
                         
                     }
                     
                     else {
                         
                         // The server did not respond ... were we rate-limited?
                         
                         NSLog(@"The response status code is %ld",
                               
                               urlResponse.statusCode);
                         
                     }
                     
                 }
                 
                 [self deliverButtonAction:nil detailInfo:@"shareTwitterOk"];
                 
                 [self close];
             });
         }
     }];
}
- (void)sinaweiboPublish
{
    NSArray *accouts = [[ShareAccountManager sharedInstance]accountWithIdentifier:self.accountIdentifier];
    if(!accouts || accouts.count<=0){
        return;
    }
    ACAccount *account = accouts[0];
    NSURL *url;
    if(self.hasAttachPictures){
        url = [NSURL URLWithString:@"https://upload.api.weibo.com/2/statuses/upload.json"];
    }
    else{
       url = [NSURL URLWithString:@"https://api.weibo.com/2/statuses/update.json"];
    }
    
    NSString *content = self.shareContent.string;
    
    NSDictionary *para = @{@"status":content};
    SLRequest *request = [SLRequest requestForServiceType:SLServiceTypeSinaWeibo requestMethod:SLRequestMethodPOST URL:url parameters:para];
    if(self.hasAttachPictures){
        for(NSDictionary *pic in self.pictures){
            NSString *filename =  pic[@"filename"];
            NSData *data = pic[@"data"];
            [request addMultipartData:data withName:@"pic" type:@"multipart/form-data" filename:filename];
        }
    }
    
    //装载微博用户
    request.account = account;
    //发送微博
    [request performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error)
     {
         if (!error)
         {
             //主线程中操作UI
             dispatch_async(dispatch_get_main_queue(), ^{
                 NSString *response = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
                 NSLog(@"请求结果:%@",response);
                 //操作UI
                 
                 [self deliverButtonAction:nil detailInfo:@"shareWeiboOk"];
                 
                 [self close];
             });
         }
     }];

}
- (void)tencentweiboPublish
{
    
}
- (void)requestSinaWeiboWithAccount:(ACAccount *)account
{
    /*
     //类型
     SLServiceTypeTwitter
     SLServiceTypeFacebook
     SLServiceTypeSinaWeibo
     
     //方法
     SLRequestMethodGET
     SLRequestMethodPOST
     SLRequestMethodDELETE
     */
    
    //请求地址，参考上图
    //NSURL *url = [NSURL URLWithString:@"https://api.weibo.com/2/statuses/update.json"];
    
    NSURL *url = [NSURL URLWithString:@"https://upload.api.weibo.com/2/statuses/upload.json"];
    
    //配置参数字典
    NSDictionary *para = [NSDictionary dictionaryWithObjectsAndKeys:@"testme", @"status", nil];
    //配置轻取
    SLRequest *request = [SLRequest requestForServiceType:SLServiceTypeSinaWeibo requestMethod:SLRequestMethodPOST URL:url parameters:para];
    
    
    NSImage *image = [NSImage imageNamed:@"sinaweibo1.png"];
    //NSData  *myImageData = [image TIFFRepresentation];
    
    NSBitmapImageRep *imgRep = [[image representations] objectAtIndex: 0];
    NSData *myImageData = [imgRep representationUsingType: NSPNGFileType properties: nil];
    
    [request addMultipartData:myImageData withName:@"pic" type:@"multipart/form-data" filename:@"sinaweibo1.png"];
    
    //装载微博用户
    request.account = account;
    //发送微博
    [request performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error)
     {
         if (!error)
         {
             //主线程中操作UI
             dispatch_async(dispatch_get_main_queue(), ^{
                 NSString *response = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
                 NSLog(@"请求结果:%@",response);
                 //操作UI
                 
                 [self close];
             });
         }
     }];
}



-(void)tencentWeibo{
    
    
    
    ACAccountStore *account=[[ACAccountStore alloc] init];  //本机账户数据库, 储存weibo,facebook等各种账户
    
    ACAccountType *accountType=[account accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTencentWeibo];
    
    NSLog(@"accountType:%@",accountType);
    
    
    
    [account requestAccessToAccountsWithType:accountType options:@{ACTencentWeiboAppIdKey:@"801410926"} completion:^(BOOL granted, NSError *error) {
        
        if (granted) {
            
            NSLog(@"认证通过");
            
            
            
            if (!self.shareContent.string) {
                
                
                
                /* UIAlertView *a=[[UIAlertView alloc] initWithTitle:@"提示" message:@"请输入要发分享的内容" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                 
                 [a show];*/
                
                return ;
                
                
                
            }
            
            NSArray *arrayAccounts=[account accountsWithAccountType:accountType];
            
            NSLog(@"arrayAccounts:%@",arrayAccounts);
            
            if ([arrayAccounts count]>0) {
                
                //                NSLog(@"认证通过");
                
                SLRequest *request = [SLRequest  requestForServiceType:SLServiceTypeTencentWeibo
                                      
                                      
                                      
                                                         requestMethod:SLRequestMethodPOST
                                      
                                      
                                      
                                                                   URL:[NSURL URLWithString:@"https://open.t.qq.com/api/t/add_pic"]
                                      
                                      
                                      
                                                            parameters:@{@"content": self.shareContent.string}];
                
                NSLog(@"account:%@",[[arrayAccounts objectAtIndex:0] class]);
                
                request.account=[arrayAccounts objectAtIndex:0] ;
                
                
                
                //[request addMultipartData:self.imageData withName:@"pic" type:@"multipart/form-data" filename:@"a.png"];
                
                [request performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
                    
                    id jsonObj = [NSJSONSerialization JSONObjectWithData:responseData
                                  
                                  
                                  
                                                                 options:NSJSONReadingAllowFragments error:&error];
                    
                    NSLog(@"jsonObj:%@",jsonObj);
                    
                    if (!error) {
                        
                        
                        
                        NSLog(@"%@",[jsonObj objectForKey:@"statuses"])  ;  //key更具api json决定
                        
                        /*    UIAlertView *a=[[UIAlertView alloc] initWithTitle:@"提示" message:@"分享成功" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                         
                         [a show];*/
                        
                        
                        
                    }
                    
                    
                    
                }];
                
                
                
            }else{
                
                
                
                /* UIAlertView *a=[[UIAlertView alloc] initWithTitle:@"提示" message:@"无效账户,请到设置界面设置账号信息" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                 
                 [a show];*/
                
            }
            
            
        }
        
    }];
    
}

- (XXXOpenFileManager*)openFileManager{
    if(!_openFileManager){
        _openFileManager = [[XXXOpenFileManager alloc]init];
        _openFileManager.canChooseFiles = YES;
        _openFileManager.allowsMultipleSelection = YES;
        _openFileManager.canChooseDirectories = NO;
    }
    return _openFileManager;
}


#pragma mark - CNUserNotification Delegate

- (BOOL)userNotificationCenter:(CNUserNotificationCenter *)center shouldPresentNotification:(CNUserNotification *)notification {
	return YES;
}

- (void)userNotificationCenter:(CNUserNotificationCenter *)center didActivateNotification:(CNUserNotification *)notification {
       NSLog(@"userNotificationCenter:didActivateNotification: %@", notification);
	
}

- (void)userNotificationCenter:(CNUserNotificationCenter *)center didDeliverNotification:(CNUserNotification *)notification {
    //    NSLog(@"userNotificationCenter:didDeliverNotification: %@", notification);
}
@end

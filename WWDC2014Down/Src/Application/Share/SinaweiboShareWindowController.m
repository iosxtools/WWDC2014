//
//  SinaweiboShareWindowController.m
//  WWDC2014Down
//
//  by @iosxtools on Twitter on 14-2-13.
//  Copyright (c) http://www.iosxtools.com. All rights reserved.
//

#import "SinaweiboShareWindowController.h"
#import <Social/Social.h>
#import <Accounts/Accounts.h>
@interface SinaweiboShareWindowController ()
- (ACAccount*)sinaWeiboAccout;
@end

@implementation SinaweiboShareWindowController

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
    
    //[self buttonConfig];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}
- (IBAction)shareAction:(id)sender;
{
    NSString *content = self.shareContent.string;
    if(!content){
        return;
    }
    
}
- (IBAction)attachAction:(id)sender;
{
    
}
- (void)buttonConfig
{
    
    ACAccount *account = [self sinaWeiboAccout];
    if(!account){
        return;
    }
    NSString *userName = account.accountDescription;
    if(!userName){
        userName = account.username;
    }
    self.accountNameLable.stringValue = userName;
}
- (void)subtleButtonEvent:(NSEvent *)event from:(id)sender;
{
    NSString *content = self.shareContent.string;
    if(!content){
        return;
    }
    ACAccount *account = [self sinaWeiboAccout];
    if(!account){
        return;
    }
    [self requestSinaWeiboWithAccount:account];
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
    
    
#if 0
    
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
    
#endif
    
    
    
}
@end

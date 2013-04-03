//
//  alterViewController.m
//  alter
//
//  Created by shisan lang on 11-8-15.
//  Copyright 2011年 BeiJingChaoYangQu. All rights reserved.
//

#import "alterViewController.h"

@implementation alterViewController

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/**/
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    /*   alert  */
//    UIAlertView* addAlert = [[[UIAlertView alloc] 
//                              initWithTitle:@"提示" 
//                              message:@"请输入至少四位股票代码或两位股票名称首字母！" 
//                              delegate:nil 
//                              cancelButtonTitle:@"确定" 
//                              otherButtonTitles:nil] autorelease];
//    [addAlert show];
    /*   commit   */
    UIAlertView* alert = [[UIAlertView alloc] 
                              initWithTitle:@"更新" 
                              message:@"和讯行情客户端有新版本" 
                              delegate:self 
                              cancelButtonTitle:@"取消" 
                              otherButtonTitles:@"更新",
                              nil];
    [alert show];
    [alert release];
    /*   self   */
//    if (!_alertView)
//    {
//        _alertView = [[UIAlertView alloc] initWithTitle:title message:@"\n\n\n" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"登录", nil];
//        _alertView.delegate = self;
//        
//        usernameField = [[UITextField alloc] initWithFrame:CGRectMake(12.0, 50.0, 260.0, 25.0)];
//        usernameField.delegate = self;
//        usernameField.placeholder = @"用户名";
//        usernameField.autocapitalizationType = UITextAutocapitalizationTypeNone;
//        usernameField.autocorrectionType = UITextAutocorrectionTypeNo;
//        usernameField.returnKeyType = UIReturnKeyNext;
//        usernameField.keyboardType = UIKeyboardTypeEmailAddress;
//        [usernameField setBackgroundColor:[UIColor whiteColor]];
//        [_alertView addSubview:usernameField];
//        
//        passwordField = [[UITextField alloc] initWithFrame:CGRectMake(12.0, 85.0, 260.0, 25.0)];
//        passwordField.delegate = self;
//        passwordField.placeholder = @"密码";
//        passwordField.secureTextEntry = YES;
//        passwordField.returnKeyType = UIReturnKeyGo;
//        [passwordField setBackgroundColor:[UIColor whiteColor]];
//        [_alertView addSubview:passwordField];
//        
//        CGAffineTransform myTransform = CGAffineTransformMakeTranslation(0.0, 00.0);
//        [_alertView setTransform:myTransform];
//    }else {
//        _alertView.title = title;
//        usernameField.text = nil;
//        passwordField.text = nil;
//    }
//    
//    [usernameField becomeFirstResponder];
//    [_alertView show];
}
/**/

//- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
//    if (buttonIndex == 1) {
//        self.userName = usernameField.text;
//        self.password = passwordField.text;
//        
//        [self performSelector:@selector(doResponse) withObject:nil afterDelay:0.1];
//    }
//}

- (void) alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"buttonIndex=%d",buttonIndex);
    if (buttonIndex == 0) {
        NSLog(@"cancel");
    } else {
        NSLog(@"update");
    }
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

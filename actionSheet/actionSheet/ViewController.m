//
//  ViewController.m
//  actionSheet
//
//  Created by dxd on 14-3-31.
//  Copyright (c) 2014年 dxd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIButton *aBut = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    aBut.frame = CGRectMake(50, 100, 200, 30);
    [aBut setTitle:@"显示ActionSheet" forState:UIControlStateNormal];
    [aBut addTarget:self action:@selector(showActionSheet) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:aBut];
}

- (void)showActionSheet
{
    UIActionSheet *sheet=[[UIActionSheet alloc] initWithTitle:@"你确定？" delegate:self cancelButtonTitle:@"不确定" destructiveButtonTitle:@"非常确定" otherButtonTitles: nil];
    [sheet showInView:self.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    //该方法由UIActionSheetDelegate协议定义，在点击ActionSheet的按钮后自动执行
    NSString *string=[NSString stringWithFormat:@"你点击了 %@",[actionSheet buttonTitleAtIndex:buttonIndex]];
    
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"提示" message:string delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消",nil];
    alert.alertViewStyle=UIAlertViewStyleDefault;
    //UIAlertViewStyleDefault 默认风格，无输入框
    　　//UIAlertViewStyleSecureTextInput 带一个密码输入框
    　　//UIAlertViewStylePlainTextInput 带一个文本输入框
    　　//UIAlertViewLoginAndPasswordInput 带一个文本输入框，一个密码输入框
    [alert show];
    
}
-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    //该方法由UIAlertViewDelegate协议定义，在点击AlertView按钮时自动执行，所以如果这里再用alertView来弹出提//示，就会死循环，不停的弹AlertView
    NSString * string=[NSString stringWithFormat:@"你点击了 %@",[alertView buttonTitleAtIndex:buttonIndex]];
    //    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"提示" message:string delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
    //    [alert show];
    NSLog(@"%@",string);
    
    //NSLog(@"输入 %@",[[alertView textFieldAtIndex:0] text]); 获取第一个文本框输入的文本，如果没有文件框，会异常，索引从0开始
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

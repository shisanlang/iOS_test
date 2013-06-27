//
//  ViewController.m
//  textfield
//
//  Created by duan on 13-6-27.
//  Copyright (c) 2013年 duan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize password;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    password = [[UITextField alloc]init];
    password.delegate = self;
    password.frame = CGRectMake(20, 225, 280, 30);
    [password setBorderStyle:UITextBorderStyleRoundedRect]; //外框类型
    password.placeholder = @"密码";
    password.returnKeyType = UIReturnKeyDone;  //键盘返回类型
    password.clearButtonMode = UITextFieldViewModeWhileEditing; //编辑时会出现个修改X
    //    password.delegate = self;
    //    password.keyboardType = UIKeyboardTypeNumberPad;//键盘显示类型
    [self.view addSubview:password];
    [password release];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [password resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

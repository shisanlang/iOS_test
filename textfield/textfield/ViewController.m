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

//#define VIEW_CENTER_VALUE CGPointMake(160,274+20) //i5 4'
#define VIEW_CENTER_VALUE CGPointMake(160,230+20)   //i4 3.5'

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
    
    NSLog(@"self = %f,%f",self.view.center.x,self.view.center.y);
    self.view.center = VIEW_CENTER_VALUE;
}


//隐藏键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

//
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [password resignFirstResponder];
}

//键盘不被挡住
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    CGPoint centerPoint = textField.center;
    [UIView beginAnimations:@"ResizeForKeyBoard" context:nil];
    [UIView setAnimationDuration:0.30f];
    self.view.center=CGPointMake(centerPoint.x, centerPoint.y-130);
//    [textField resignFirstResponder];
    [UIView commitAnimations];
    return YES;
    
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
//    [textField resignFirstResponder];
    [UIView beginAnimations:@"ResizeForKeyBoard" context:nil];
    [UIView setAnimationDuration:0.30f];
    self.view.center=VIEW_CENTER_VALUE;
    [UIView commitAnimations];
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

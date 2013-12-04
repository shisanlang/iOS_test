//
//  ViewController.m
//  Keychain
//
//  Created by duan on 13-12-4.
//  Copyright (c) 2013年 duan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //密码
    
    [SFHFKeychainUtils storeUsername:@"user" andPassword:@"aa" forServiceName:@"testService" updateExisting:1 error:nil];
    
//    [SFHFKeychainUtils deleteItemForUsername:@"user" andServiceName:@"testService" error:nil];
    
    //取密码：
    
    NSString *passWord =  [SFHFKeychainUtils getPasswordForUsername:@"user" andServiceName:@"testService" error:nil];
    
    NSLog(@"user = %@",passWord);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

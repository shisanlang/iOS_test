//
//  ViewController.m
//  setget
//
//  Created by dxd on 14-7-1.
//  Copyright (c) 2014年 dxd. All rights reserved.
//

#import "ViewController.h"
#import "UserInfo.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _userinfo = [[UserInfo alloc]initWithFrame:CGRectMake(10, 10, 100, 30)];
    _userinfo.name = @"1";
    _userinfo.name = @"1";
    _userinfo.name = @"123";
    NSLog(@"log = %@",_userinfo.name);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  ViewController.m
//  base
//
//  Created by duan on 13-6-8.
//  Copyright (c) 2013年 duan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize user=_user;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.user = @"dxd";
    
    NSLog(@"");
}

- (NSString *)setUser:(NSString *)username
{
    username = @"summer";
    NSLog(@"set");
    return username;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

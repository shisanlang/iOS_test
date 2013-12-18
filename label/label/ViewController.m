//
//  ViewController.m
//  label
//
//  Created by duan on 13-12-18.
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
    UILabel * txtLabel = [[UILabel alloc] init];
    txtLabel.frame = CGRectMake(40, 40, 100, 20);
    txtLabel.text = @"123\ue415abc";
    [self.view addSubview:txtLabel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

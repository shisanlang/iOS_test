//
//  ViewController.m
//  UIRadio
//
//  Created by duan on 13-5-27.
//  Copyright (c) 2013年 duan. All rights reserved.
//

#import "ViewController.h"
#import "UIRadioButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//    UIRadioButton *but = [[UIRadioButton alloc]initWithFrame:CGRectMake(20, 20, 0, 0)];
//    but.backgroundColor = [UIColor redColor];
//    [self.view addSubview:but];
//    [but release];
    int i=0;
    if ((i = 0)|(i=20)||(i=3)) {
        NSLog(@"%d",i);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

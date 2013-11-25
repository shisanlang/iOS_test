//
//  ViewController.m
//  view
//
//  Created by duan on 13-11-22.
//  Copyright (c) 2013年 duan. All rights reserved.
//

#import "ViewController.h"
#import "MyView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIView * aView = [[UIView alloc]init];
    aView.frame = CGRectMake(80, 30, 50, 50);
//    aView.center = CGPointMake(80, 50);
    aView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:aView];
    
    UIView * bView = [[UIView alloc]init];
    bView.frame = CGRectMake(80, 120, 50, 50);
    bView.center = CGPointMake(80, 110);
    bView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:bView];
    
    MyView * cView = [[MyView alloc]init];
    cView.frame = CGRectMake(80, 200, 200, 200);
    cView.backgroundColor = [UIColor redColor];
    [self.view addSubview:cView];
    
//    [cView setNeedsDisplay];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

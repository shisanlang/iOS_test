//
//  ViewController.m
//  lineInterval
//
//  Created by dxd on 14-3-5.
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
    
    UILabel * label1 = [[UILabel alloc]init];
    label1.frame = CGRectMake(100, 10, 100, 90);
    label1.font = [UIFont systemFontOfSize:20];
    label1.numberOfLines = 3;
    label1.backgroundColor = [UIColor greenColor];
    label1.text = @"比如的第二行的第1个字段是文比如answer的第二行的第1个字段是文比如answer的第二行的第1个字段是文比如answer的第二行的第1个字段是文比如answer的第二行的第1个字段是文比如answer的第二行的第1个字段是文比如answer的第二行的第1个字段是文比如answer的第二行的第1个字段是文比如answer的第二行的第1个字段是文比如answer的第二行的第1个字段是文比如answer的第二行的第1个字段是文";
    [self.view addSubview:label1];
    
    
    UILabel * label2 = [[UILabel alloc]init];
    label2.frame = CGRectMake(100, 200, 100, 60);
    label2.font = [UIFont systemFontOfSize:10];
    label2.numberOfLines = 3;
    label2.backgroundColor = [UIColor yellowColor];
    label2.text = @"比如answer的第二行的第1个字段是文比如answer的第二行的第1个字段是文比如answer的第二行的第1个字段是文比如answer的第二行的第1个字段是文比如answer的第二行的第1个字段是文比如answer的第二行的第1个字段是文比如answer的第二行的第1个字段是文比如answer的第二行的第1个字段是文比如answer的第二行的第1个字段是文比如answer的第二行的第1个字段是文比如answer的第二行的第1个字段是文";
    [self.view addSubview:label2];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

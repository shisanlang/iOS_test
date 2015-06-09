//
//  ViewController.m
//  draw
//
//  Created by duanxiaodong on 15/6/9.
//  Copyright (c) 2015年 GuoXinHuiJin. All rights reserved.
//

#import "ViewController.h"
#import "DrawView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    DrawView * view = [[DrawView alloc]initWithFrame:CGRectMake(0, 40, 300, 300)];
    view.backgroundColor = [UIColor brownColor];
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

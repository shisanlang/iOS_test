//
//  ViewController.m
//  pudding
//
//  Created by dxd on 15/3/23.
//  Copyright (c) 2015年 dxd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    blockView = [[BlockView alloc]initWithFrame:CGRectMake(10, 10, 40, 40)];
    blockView.from = 10;
    blockView.to = 500;
    blockView.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:blockView];
    
    UIButton * button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button1.frame = CGRectMake(200, 70, 30, 20);
    [button1 setTitle:@"上" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(doTouchUp1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    UIButton * button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button2.frame = CGRectMake(200, 120, 30, 20);
    [button2 setTitle:@"下" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(doTouchUp2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
}

- (void)doTouchUp1 {
    [blockView startAnimationFrom:10 to:500];
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.85 initialSpringVelocity:0 options:0 animations:^{
        blockView.center = CGPointMake(blockView.center.x, 500);
    } completion:^(BOOL finished) {
        [blockView completeAnimation];
    }];
    
}

- (void)doTouchUp2 {
    [blockView startAnimationFrom:500 to:50];
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.85 initialSpringVelocity:0 options:0 animations:^{
        blockView.center = CGPointMake(blockView.center.x, 50);
    } completion:^(BOOL finished) {
        [blockView completeAnimation];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

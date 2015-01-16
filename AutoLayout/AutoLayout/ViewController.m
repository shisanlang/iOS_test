//
//  ViewController.m
//  AutoLayout
//
//  Created by dxd on 14-11-6.
//  Copyright (c) 2014年 dxd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UILabel * label1 = [[UILabel alloc]init];
    label1.frame = CGRectMake(10, 80, 100, 20);
    label1.backgroundColor = [UIColor greenColor];
//    label1.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:label1];
    
    UILabel * label2 = [[UILabel alloc]init];
    label2.frame = CGRectMake(130, 80, 140, 20);
    label2.backgroundColor = [UIColor purpleColor];
//    label2.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:label2];
    
    
    UILabel * label3 = [[UILabel alloc]init];
    label3.frame = CGRectMake(0, 120, 140, 20);
    label3.backgroundColor = [UIColor cyanColor];
    label3.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:label3];
    
    
    UILabel * label4 = [[UILabel alloc]init];
//    label4.frame = CGRectMake(160, 120, 100, 20);
    label4.backgroundColor = [UIColor magentaColor];
    label4.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:label4];
    
    //
    id lable3_l = [NSLayoutConstraint constraintWithItem:label3 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:20];
    [self.view addConstraint:lable3_l];
    id lable3_t = [NSLayoutConstraint constraintWithItem:label3 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:80+40];
    [self.view addConstraint:lable3_t];
    id lable3_w = [NSLayoutConstraint constraintWithItem:label3 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1.0 constant:-200];
    [self.view addConstraint:lable3_w];
    id lable3_h = [NSLayoutConstraint constraintWithItem:label3 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0 constant:20];
    [self.view addConstraint:lable3_h];
    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:label4 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:label3 attribute:NSLayoutAttributeRight multiplier:1.0 constant:20]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:label4 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:label3 attribute:NSLayoutAttributeTop multiplier:1.0 constant:0]];
//
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:label4 attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:-20]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:label4 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:label3 attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0]];
    
    
    //
    NSDictionary * viewsDictionary = NSDictionaryOfVariableBindings(label3,label4);
    NSLog(@"viewdic = %@",viewsDictionary);
    id label4_ho = [NSLayoutConstraint constraintsWithVisualFormat:@"[label3]-20-[label4]-20-|" options:0 metrics:nil views:viewsDictionary];
    [self.view addConstraints:label4_ho];
    id label4_ve = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-120-[label4(==label3)]" options:0 metrics:nil views:viewsDictionary];//120的80+40计算问题；120=label3.height问题
    [self.view addConstraints:label4_ve];
    
    labelWidthConstraint.constant = 300;
    labelLeftConstraint.constant = 10;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

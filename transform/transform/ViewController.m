//
//  ViewController.m
//  transform
//
//  Created by dxd on 14/11/17.
//  Copyright (c) 2014年 dxd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _label1 = [[UILabel alloc]initWithFrame:CGRectMake(50, 50, 70, 50)];
    _label1.backgroundColor = [UIColor magentaColor];
    _label1.text = @"7";
    _label1.font = [UIFont systemFontOfSize:40];
    [self.view addSubview:_label1];
    
    //缩放
//    CGAffineTransform  transform;
//    transform = CGAffineTransformScale(_label1.transform,1.2,1.2);
//    [UIView beginAnimations:@"scale" context:nil];
//    [UIView setAnimationDuration:2];
//    [_label1 setTransform:transform];
//    [UIView commitAnimations];
    
    //
}

- (IBAction)doInvert:(id)sender {
    CGAffineTransform transform = CGAffineTransformInvert(_label1.transform);//CGAffineTransformIdentity;//CGAffineTransformMakeScale(1.2, 1.2);//CGAffineTransformMakeRotation(M_PI/4);
    [UIView beginAnimations:@"invert" context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:2];
    _label1.transform = transform;
    [UIView commitAnimations];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

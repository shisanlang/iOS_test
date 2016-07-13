//
//  ViewController.m
//  DataType
//
//  Created by dxd on 15/8/17.
//  Copyright (c) 2015年 GuoXinHuiJin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    int d1 = 1;
    NSNumber * d2 = @2;
    NSArray * d3 = @[@1,@2];
    
    if ([d3[0] isKindOfClass:[NSNumber class]]) {
        NSLog(@"d3 0");
    }
    
    if ([d3[1] isKindOfClass:[NSNumber class]]) {
        NSLog(@"d3 1");
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

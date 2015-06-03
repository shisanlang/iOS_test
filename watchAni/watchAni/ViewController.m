//
//  ViewController.m
//  watchAni
//
//  Created by duanxiaodong on 15/6/3.
//  Copyright (c) 2015年 GuoXinHuiJin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //
    float x = 0;//画布大小
    float y = 0;
    float w = 320;
    float h = 600;
    float dia = 50;//直径
    
    //创建
    NSArray * cirArray = @[
                           @{@"color":[UIColor redColor]},
                           @{@"color":[UIColor blueColor]}
                           ];
    
    
    for (int i=0; i<cirArray.count; i++) {
        UIButton * but = [UIButton buttonWithType:UIButtonTypeCustom];
        but.backgroundColor = [cirArray[i] objectForKey:@"color"];
        but.frame = CGRectMake(0, 0, dia, dia);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

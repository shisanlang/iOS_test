//
//  NavViewController.m
//  multiView
//
//  Created by duanxiaodong on 15/5/20.
//  Copyright (c) 2015年 GuoXinHuiJin. All rights reserved.
//

#import "NavViewController.h"
#import "LeftViewController.h"
#import "RightViewController.h"
#import "CenterViewController.h"
#import "HomeNavViewController.h"

@interface NavViewController ()

@end

@implementation NavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavigationBarHidden:YES];
    
    LeftViewController * lvc = [[LeftViewController alloc]init];
    RightViewController * rvc = [[RightViewController alloc]init];
    CenterViewController * cvc = [[CenterViewController alloc]init];
    HomeNavViewController * hNav = [[HomeNavViewController alloc]initWithRootViewController:cvc];
    
//    [self.view addSubview:lvc.view];
//    [self.view addSubview:rvc.view];
    [self.view addSubview:hNav.view];
    
    NSLog(@"hNav = %f",hNav.view.frame.size.height);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

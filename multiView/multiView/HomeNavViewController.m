//
//  HomeNavViewController.m
//  multiView
//
//  Created by duanxiaodong on 15/5/20.
//  Copyright (c) 2015年 GuoXinHuiJin. All rights reserved.
//

#import "HomeNavViewController.h"

@interface HomeNavViewController ()

@end

@implementation HomeNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    self.navigationItem.title = @"中";
//    [self.navigationBar setBackgroundImage:nil forBarPosition:UIBarPositionBottom barMetrics:UIBarMetricsDefault];
    self.navigationBar.barTintColor = [UIColor magentaColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"左" style:UIBarButtonItemStyleBordered target:self action:@selector(doLeft:)];
    
    self.view.backgroundColor = [UIColor cyanColor];
}

- (void)doLeft:(id)sender {
    NSLog(@"right");
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

//
//  LeftViewController.m
//  multiView
//
//  Created by duanxiaodong on 15/5/20.
//  Copyright (c) 2015年 GuoXinHuiJin. All rights reserved.
//

#import "LeftViewController.h"

@interface LeftViewController ()

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    
    UILabel * label = [[UILabel alloc]init];
    label.frame = CGRectMake(10, 150, 80, 30);
    label.text = @"左路";
    [self.view addSubview:label];}

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

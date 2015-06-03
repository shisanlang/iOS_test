//
//  CenterViewController.m
//  multiView
//
//  Created by duanxiaodong on 15/5/20.
//  Copyright (c) 2015年 GuoXinHuiJin. All rights reserved.
//

#import "CenterViewController.h"

@interface CenterViewController ()

@end

@implementation CenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor greenColor];
    
    self.navigationController.navigationBar.tintColor = [UIColor redColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"右右右" style:UIBarButtonItemStylePlain target:self action:@selector(doRight:)];
//    UIButton * rightButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
//    [rightButton setBackgroundColor:[UIColor redColor]];
//    [rightButton addTarget:self action:@selector(doRight:) forControlEvents:UIControlEventTouchUpInside];
//    [rightButton setTitle:@"右右右" forState:UIControlStateNormal];
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
//    self.title = @"中";
    
    UILabel * label = [[UILabel alloc]init];
    label.frame = CGRectMake(10, 150, 80, 30);
    label.text = @"中路";
    [self.view addSubview:label];
}

- (void)doRight:(id)sender {
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

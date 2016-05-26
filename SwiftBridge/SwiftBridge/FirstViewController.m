//
//  FirstViewController.m
//  SwiftBridge
//
//  Created by 十三郎 on 16/5/19.
//  Copyright © 2016年 QianHai. All rights reserved.
//

#import "FirstViewController.h"
#import "SwiftBridge-swift.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 200, 80, 40);
    button.backgroundColor = [UIColor brownColor];
    [button setTitle:@"进入Swift" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(swiftTouchUp) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)swiftTouchUp {
    AboutViewController * sVC = [[AboutViewController alloc]init];
    [sVC showLog:(@"swift")];
    [self.navigationController pushViewController:sVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  ViewController.m
//  cocoapods
//
//  Created by dxd on 14-10-11.
//  Copyright (c) 2014年 dxd. All rights reserved.
//

#import "ViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <AFNetworking/AFHTTPClient.h>
#import <SVProgressHUD.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIImageView * image = [[UIImageView alloc]initWithFrame:CGRectMake(10, 80, 100, 100)];
    [image setImageWithURL:[NSURL URLWithString:@"http://pccoo.cn/ablum/20130201/20130201130838021.jpg"]];
    [self.view addSubview:image];
    
    AFHTTPClient;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

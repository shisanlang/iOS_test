//
//  ViewController.m
//  label
//
//  Created by duan on 13-12-18.
//  Copyright (c) 2013年 duan. All rights reserved.
//

#import "ViewController.h"
#import "TextLayoutLabel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//    UILabel
    TextLayoutLabel * txtLabel = [[TextLayoutLabel alloc] init];
    txtLabel.frame = CGRectMake(40, 40, 240, 200);
    txtLabel.text = @"123\ue415abc";
    txtLabel.lineBreakMode = NSLineBreakByWordWrapping;
    txtLabel.numberOfLines = 0;
    txtLabel.linesSpacing = 0;
    txtLabel.text = @"使用百度推广以后，公司每天收到的电话咨询量及网络访问量都有了3倍以上的增长，订单数量及新客户开发量也上升了3倍以上，网络营销带来的业绩增长翻了5倍，公司规模不断扩大。\n    战略效果维普软件的推广模式从之前的线上线下同时开展，但规模都较小，现在公司的商机百分之八十来源于网络营销，构建了一整套营销机制，建立了专业的团队负责这套机制的运转，经过近一年的实验，已经取得初步成功。维普软件成为国内领先的项目管理解决方案提供商，主要为国内非工程领域的企业提供专业的项目管理咨询，产品及技术服务，目前已经在金融、军工、汽车、电力、电信等高端领域的企业树立了大量的标杆客户。";
    [self.view addSubview:txtLabel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  ViewController.m
//  navigation
//
//  Created by dxd on 14-3-24.
//  Copyright (c) 2014年 dxd. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController ()

@end


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"home";
    
    UILabel * lable = [[UILabel alloc]initWithFrame:CGRectMake(20, 600, 200, 30)];
    lable.backgroundColor = [UIColor greenColor];
    lable.text = @"sldfjlsdjfljsdlfjsdljfl";
    
    UIScrollView * scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)];
    scroll.backgroundColor = [UIColor brownColor];
    scroll.contentSize = CGSizeMake(320, 1000);
    [scroll addSubview:lable];
    [self.view addSubview:scroll];
    [scroll release];
    [lable release];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(30, 100, 200, 40);
    button.backgroundColor = [UIColor cyanColor];
    [button setTitle:@"go" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(goTouchUp) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

- (void)goTouchUp {
    DetailViewController * dVC = [[DetailViewController alloc]init];
    [self.navigationController pushViewController:dVC animated:YES];
    [dVC release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

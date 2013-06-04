//
//  ViewController.m
//  Block
//
//  Created by duan on 13-5-30.
//  Copyright (c) 2013年 duan. All rights reserved.
//

#import "ViewController.h"
#import "DxdsButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//    int x = 123;
//    void (^printXy)(int) = ^(int y) {
//        printf("%d %d",x , y);
//    };
//    printXy(456);
    
    DxdsButton *but = [DxdsButton buttonWithType:UIButtonTypeRoundedRect];
    but.frame = CGRectMake(20, 20, 80, 50);
    [but setImage:@"image2" forState:UIControlStateNormal];
    [but setTitle:@"but" forState:UIControlStateNormal];

    [but handleControlEvent:UIControlEventTouchUpInside withBlock:^(id sender){NSLog(@"123");}];
    [self.view addSubview:but];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

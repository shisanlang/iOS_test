//
//  ViewController.m
//  image
//
//  Created by duan on 12-11-14.
//  Copyright (c) 2012年 duan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIImageView * image1VC = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];
    image1VC.image = [UIImage imageNamed:@"bg.png"];
    NSLog(@"image or = %d",image1VC.image.imageOrientation);
    [self.view addSubview:image1VC];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

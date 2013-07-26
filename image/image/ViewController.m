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
    
    UIButton *but = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [but addTarget:self action:@selector(do:) forControlEvents:UIControlEventTouchUpInside];
    but.frame = CGRectMake(240, 0, 80, 80);
    [self.view addSubview:but];
    
    subView1 = [[UIView alloc]init];
    subView1.frame = CGRectMake(50, 100, 200, 80);
    [self.view addSubview:subView1];
    
    
    image1VC = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 120, 40)];
    image1VC.image = [UIImage imageNamed:@"bg.png"];
    image1VC.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;// | UIViewAutoresizingFlexibleWidth;//UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleBottomMargin;
//    NSLog(@"image or = %d",image1VC.image.imageOrientation);
//    [self.view addSubview:image1VC];
    [image1VC.image stretchableImageWithLeftCapWidth:20 topCapHeight:20];
    [subView1 addSubview:image1VC];
    
    NSLog(@"%f,%f,%f,%f",subView1.frame.origin.x,subView1.frame.origin.y,subView1.frame.size.width,subView1.frame.size.height);
    NSLog(@"%f,%f,%f,%f",image1VC.frame.origin.x,image1VC.frame.origin.y,image1VC.frame.size.width,image1VC.frame.size.height);
}

- (void)do:(id)sender
{
    subView1.frame = CGRectMake(50, 100, 400, 160);
    NSLog(@"%f,%f,%f,%f",subView1.frame.origin.x,subView1.frame.origin.y,subView1.frame.size.width,subView1.frame.size.height);
    NSLog(@"%f,%f,%f,%f",image1VC.frame.origin.x,image1VC.frame.origin.y,image1VC.frame.size.width,image1VC.frame.size.height);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

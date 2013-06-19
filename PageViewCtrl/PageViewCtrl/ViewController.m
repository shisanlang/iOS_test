//
//  ViewController.m
//  PageViewCtrl
//
//  Created by duan on 13-6-19.
//  Copyright (c) 2013年 duan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize imageScroll,pageControl;
@synthesize imageNum;
@synthesize Image1,Image2,Image3,Image4;
@synthesize ImageButton1,ImageButton2,ImageButton3,ImageButton4;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    imageScroll = [[UIScrollView alloc]init];
    imageScroll.frame = CGRectMake(0, 0, 320, 200);
    imageScroll.contentSize = CGSizeMake(320*5, 198);
    imageScroll.showsHorizontalScrollIndicator = NO;
    imageScroll.showsVerticalScrollIndicator = NO;
    imageScroll.delegate = self;
    imageScroll.scrollEnabled = YES;
    imageScroll.pagingEnabled = YES;
    imageScroll.bounces = YES;
    [self.view addSubview:imageScroll];
    
    
    //
    Image1 = [[UIImageView alloc]init];
    Image1.frame = CGRectMake(0, 0, 320, 200);
    Image1.image = [UIImage imageNamed:@"jp2013061901.jpg"];
    [imageScroll addSubview:Image1];
    [Image1 release];
    
    Image2 = [[UIImageView alloc]init];
    Image2.frame = CGRectMake(320*1, 0, 320, 200);
    Image2.image = [UIImage imageNamed:@"jp2013061902.jpg"];
    [imageScroll addSubview:Image2];
    [Image2 release];
    
    Image3 = [[UIImageView alloc]init];
    Image3.frame = CGRectMake(320*2, 0, 320, 200);
    Image3.image = [UIImage imageNamed:@"jp2013061903.jpg"];
    [imageScroll addSubview:Image3];
    [Image3 release];
    
    Image4 = [[UIImageView alloc]init];
    Image4.frame = CGRectMake(320*3, 0, 320, 200);
    Image4.image = [UIImage imageNamed:@"jp2013061904.jpg"];
    [imageScroll addSubview:Image4];
    [Image4 release];
    
    Image5 = [[UIImageView alloc]init];
    Image5.frame = CGRectMake(320*4, 0, 320, 200);
    Image5.image = [UIImage imageNamed:@"jp2013061905.jpg"];
    [imageScroll addSubview:Image5];
    [Image5 release];
    
    //
    pageControl = [[UIPageControl alloc]init];
    pageControl.frame = CGRectMake(240, 180, 80, 20);
    pageControl.numberOfPages = 4;
    pageControl.currentPage = 0;
    [pageControl addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:imageScroll];
    [self.view addSubview:pageControl];
    
    [imageScroll release];
    [pageControl release];
    
    //
    imageNum = [[UILabel alloc]init];
    imageNum.frame = CGRectMake(0, 180, 240, 20);
    imageNum.text = @"5张";
    imageNum.backgroundColor = [UIColor colorWithWhite:0.75 alpha:.7];
    [self.view addSubview:imageNum];
    [imageNum release];
}

//scroll
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //    if (scrollView == pageControl) {
    pageControl.currentPage = imageScroll.contentOffset.x/320;
    //    }
}

//pageControl
- (void)changePage:(id)sender
{
    [imageScroll setContentOffset:CGPointMake(320*pageControl.currentPage, 0)];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

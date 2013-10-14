//
//  FavViewController.m
//  tabbar
//
//  Created by duan on 13-10-14.
//  Copyright (c) 2013年 duan. All rights reserved.
//

#import "FavViewController.h"

@interface FavViewController ()

@end

@implementation FavViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidAppear:(BOOL)animated
{
    if([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0)
    {
//        self.edgesForExtendedLayout= UIRectEdgeNone;
//        self.navigationController.navigationBar.translucent = NO;
//        self.tabBarController.tabBar.translucent = NO;
    }

    
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:50/255.0 green:50/255 blue:50/255 alpha:.5]];
    NSLog(@"nav = %@",self.navigationController.navigationBar);
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blueColor];
    
    
    
    UIImageView * bgImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"mm.jpg"]];
    [self.view addSubview:bgImageView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

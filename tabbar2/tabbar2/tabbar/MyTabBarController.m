//
//  MyTabBarController.m
//  tabbar2
//
//  Created by duan on 13-12-19.
//  Copyright (c) 2013年 duan. All rights reserved.
//

#import "MyTabBarController.h"

@interface MyTabBarController ()

@end

@implementation MyTabBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    self.tabBar.tintColor = [UIColor blueColor];
//    self.tabBar.backgroundColor = [UIColor redColor];
    
    
//    UITabBar * tab = [[[UITabBar alloc]init]autorelease];
    UITabBarItem *item1 = [[UITabBarItem alloc] initWithTitle:@"Second" image:nil tag:1];
    NSArray *items = [[NSArray alloc]initWithObjects:item1, nil];
//    [self.tabBar setItems:items animated:YES];

    
//    [self.view addSubview:tab];
    UILabel * lbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 20)];
    lbl.text = @"123123";
    
    UIScrollView * scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 300, 40)];
    scrollView.showsHorizontalScrollIndicator = YES;
    scrollView.showsVerticalScrollIndicator = YES;
    scrollView.delegate = self;
	scrollView.bounces = YES;
    scrollView.contentSize = CGSizeMake(320+150, 49);
    scrollView.backgroundColor = [UIColor redColor];
    
    [scrollView addSubview:lbl];
    
    
//    [self.tabBar insertSubview:scrollView atIndex:0];
    
	// Do any additional setup after loading the view.
//    tabbarBgImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"nav_bar.png"]];
//    tabbarBgImage.frame=CGRectMake(0, 0, 320, 50);
//    [self.tabBar addSubview:tabbarBgImage];
//    [tabbarBgImage release];
//    
//    bottomselebtn1=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sale_hover.png"]];
//    bottomselebtn1.frame=CGRectMake(0, 0, 80, 50);
//    [self.tabBar addSubview:bottomselebtn1];
//    [bottomselebtn1 release];
//    
//    bottomselebtn2=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"the_car.png"]];
//    bottomselebtn2.frame=CGRectMake(80, 0, 80, 50);
//    [self.tabBar addSubview:bottomselebtn2];
//    [bottomselebtn2 release];
//    
//    bottomselebtn3=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"collect.png"]];
//    bottomselebtn3.frame=CGRectMake(80*2, 0, 80, 50);
//    [self.tabBar addSubview:bottomselebtn3];
//    [bottomselebtn3 release];
//    
//    bottomselebtn4=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"more.png"]];
//    bottomselebtn4.frame=CGRectMake(80*3, 0, 80, 50);
//    [self.tabBar addSubview:bottomselebtn4];
//    [bottomselebtn4 release];
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
//    
//    int selectedIndex = [tabBar.items indexOfObject:item];
//    //    NSLog(@"sel = %d",selectedIndex);
//    if (selectedIndex==0) {
//        bottomselebtn1.image=[UIImage imageNamed:@"sale_hover.png"];
//        bottomselebtn2.image=[UIImage imageNamed:@"the_car.png"];
//        bottomselebtn3.image=[UIImage imageNamed:@"collect.png"];
//        bottomselebtn4.image=[UIImage imageNamed:@"more.png"];
//        
//    }else if (selectedIndex==1){
//        bottomselebtn1.image=[UIImage imageNamed:@"sale.png"];
//        bottomselebtn2.image=[UIImage imageNamed:@"the_car_hover.png"];
//        bottomselebtn3.image=[UIImage imageNamed:@"collect.png"];
//        bottomselebtn4.image=[UIImage imageNamed:@"more.png"];
//        
//    }else if (selectedIndex==2){
//        bottomselebtn1.image=[UIImage imageNamed:@"sale.png"];
//        bottomselebtn2.image=[UIImage imageNamed:@"the_car.png"];
//        bottomselebtn3.image=[UIImage imageNamed:@"collect_hover.png"];
//        bottomselebtn4.image=[UIImage imageNamed:@"more.png"];
//        
//    }else if (selectedIndex==3){
//        bottomselebtn1.image=[UIImage imageNamed:@"sale.png"];
//        bottomselebtn2.image=[UIImage imageNamed:@"the_car.png"];
//        bottomselebtn3.image=[UIImage imageNamed:@"collect.png"];
//        bottomselebtn4.image=[UIImage imageNamed:@"more_hover.png"];
//    }
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

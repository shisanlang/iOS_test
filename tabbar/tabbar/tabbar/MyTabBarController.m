//
//  MyTabBarController.m
//  maichetong
//
//  Created by duan on 13-4-25.
//  Copyright (c) 2013年 duan. All rights reserved.
//

#import "MyTabBarController.h"
//#import "common.h"

@interface MyTabBarController ()

@end

@implementation MyTabBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
//        UITabBar *tabBar=[self tabBar];
//        if ([tabBar respondsToSelector:@selector(setBackgroundImage:)])
//        {
//            // ios 5.x
//            [tabBar setBackgroundImage:[UIImage imageNamed:@"nav_bar.png"]];
//            
//        }
//        else
//        {
//            // ios 4.x
//            
//            CGRect frame = CGRectMake(0, 0, 320, 49);
//            UIView *tabbg_view = [[UIView alloc] initWithFrame:frame];
//            UIImage *tabbag_image = [UIImage imageNamed:@"nav_bar.png"];
//            UIColor *tabbg_color = [[UIColor alloc] initWithPatternImage:tabbag_image];
//            tabbg_view.backgroundColor = tabbg_color;
//            [tabBar insertSubview:tabbg_view atIndex:0];
//            
//        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    tabbarBgImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"nav_bar.png"]];
    tabbarBgImage.frame=CGRectMake(0, 0, 320, 50);
    [self.tabBar addSubview:tabbarBgImage];
    [tabbarBgImage release];
    
    bottomselebtn1=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sale_hover.png"]];
    bottomselebtn1.frame=CGRectMake(0, 0, 80, 50);
    [self.tabBar addSubview:bottomselebtn1];
    [bottomselebtn1 release];
    
    bottomselebtn2=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"the_car.png"]];
    bottomselebtn2.frame=CGRectMake(80, 0, 80, 50);
    [self.tabBar addSubview:bottomselebtn2];
    [bottomselebtn2 release];
    
    bottomselebtn3=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"collect.png"]];
    bottomselebtn3.frame=CGRectMake(80*2, 0, 80, 50);
    [self.tabBar addSubview:bottomselebtn3];
    [bottomselebtn3 release];
    
    bottomselebtn4=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"more.png"]];
    bottomselebtn4.frame=CGRectMake(80*3, 0, 80, 50);
    [self.tabBar addSubview:bottomselebtn4];
    [bottomselebtn4 release];
    
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    
    int selectedIndex = [tabBar.items indexOfObject:item];
    
    if (selectedIndex==0) {
        bottomselebtn1.image=[UIImage imageNamed:@"sale_hover.png"];
        bottomselebtn2.image=[UIImage imageNamed:@"the_car.png"];
        bottomselebtn3.image=[UIImage imageNamed:@"collect.png"];
        bottomselebtn4.image=[UIImage imageNamed:@"more.png"];
        
    }else if (selectedIndex==1){
        bottomselebtn1.image=[UIImage imageNamed:@"sale.png"];
        bottomselebtn2.image=[UIImage imageNamed:@"the_car_hover.png"];
        bottomselebtn3.image=[UIImage imageNamed:@"collect.png"];
        bottomselebtn4.image=[UIImage imageNamed:@"more.png"];
        
    }else if (selectedIndex==2){
        bottomselebtn1.image=[UIImage imageNamed:@"sale.png"];
        bottomselebtn2.image=[UIImage imageNamed:@"the_car.png"];
        bottomselebtn3.image=[UIImage imageNamed:@"collect_hover.png"];
        bottomselebtn4.image=[UIImage imageNamed:@"more.png"];
        
    }else if (selectedIndex==3){
        bottomselebtn1.image=[UIImage imageNamed:@"sale.png"];
        bottomselebtn2.image=[UIImage imageNamed:@"the_car.png"];
        bottomselebtn3.image=[UIImage imageNamed:@"collect.png"];
        bottomselebtn4.image=[UIImage imageNamed:@"more_hover.png"];
    }
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

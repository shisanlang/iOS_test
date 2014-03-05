//
//  ViewController.m
//  searchbar
//
//  Created by dxd on 14-2-18.
//  Copyright (c) 2014年 dxd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UISearchBar * seachBar=[[UISearchBar alloc] initWithFrame:CGRectMake(20, 40, 280, 20)];
    
    //修改搜索框背景
    seachBar.backgroundColor=[UIColor clearColor];
    seachBar.barTintColor = [UIColor clearColor];
    
    
    //去掉搜索框背景
    //1.
//    [[seachBar.subviews objectAtIndex:0]removeFromSuperview];
    //2.
//    for (UIView *subview in seachBar.subviews)
//        
//    {
//        
//        if ([subview isKindOfClass:NSClassFromString(@"UISearchBarBackground")])
//        {
//            
//            [subview removeFromSuperview];
//            break;
//            
//        }
//        
//    }
    
    //3自定义背景
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"waterfall_s.png"]];
//    [seachBar insertSubview:imageView atIndex:1];
//    [imageView release];
    
    
    
    //改变搜索按钮文字
    //改变UISearchBar取消按钮字体
//    for(id cc in [seachBar subviews])
//        
//    {
//        
//        if([cc isKindOfClass:[UIButton class]])
//        {
//            
//            UIButton *btn = (UIButton *)cc;
//            
//            [btn setTitle:@"搜索"  forState:UIControlStateNormal];
//        }
//        
//    }
    
    [self.view addSubview:seachBar];
}

//4输入搜索文字时隐藏搜索按钮，清空时显示
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    
    searchBar.showsScopeBar = YES;
    
    [searchBar sizeToFit];
    
    [searchBar setShowsCancelButton:YES animated:YES];
    return YES;
}

- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar {
    
    searchBar.showsScopeBar = NO;
    
    [searchBar sizeToFit];
    
    [searchBar setShowsCancelButton:NO animated:YES];
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

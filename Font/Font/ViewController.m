//
//  ViewController.m
//  Font
//
//  Created by dxd on 14-5-20.
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
    
    UILabel * font1 = [[UILabel alloc]init];
    [font1 setFrame:CGRectMake(20, 20, 280, 30)];
    [font1 setBackgroundColor:[UIColor yellowColor]];
    [font1 setTextColor:[UIColor blackColor]];
    font1.font = [UIFont systemFontOfSize:12];
    font1.text = @"12号字abc";
    [self.view addSubview:font1];
    
    UILabel * font2 = [[UILabel alloc]init];
    [font2 setFrame:CGRectMake(20, 60, 280, 30)];
    [font2 setBackgroundColor:[UIColor yellowColor]];
    [font2 setTextColor:[UIColor blackColor]];
    font2.font = [UIFont systemFontOfSize:13];
    font2.text = @"13号字abc";
    [self.view addSubview:font2];
    
    UILabel * font3 = [[UILabel alloc]init];
    [font3 setFrame:CGRectMake(20, 100, 280, 30)];
    [font3 setBackgroundColor:[UIColor yellowColor]];
    [font3 setTextColor:[UIColor blackColor]];
    font3.font = [UIFont systemFontOfSize:14];
    font3.text = @"14号字abc";
    [self.view addSubview:font3];
    
    UILabel * font4 = [[UILabel alloc]init];
    [font4 setFrame:CGRectMake(20, 140, 280, 30)];
    [font4 setBackgroundColor:[UIColor yellowColor]];
    [font4 setTextColor:[UIColor blackColor]];
    font4.font = [UIFont systemFontOfSize:15];
    font4.text = @"15号字abc";
    [self.view addSubview:font4];
    
    UILabel * font5 = [[UILabel alloc]init];
    [font5 setFrame:CGRectMake(20, 180, 280, 30)];
    [font5 setBackgroundColor:[UIColor yellowColor]];
    [font5 setTextColor:[UIColor blackColor]];
    font5.font = [UIFont systemFontOfSize:16];
    font5.text = @"16号字abc";
    [self.view addSubview:font5];
    
    UILabel * font6 = [[UILabel alloc]init];
    [font6 setFrame:CGRectMake(20, 220, 280, 30)];
    [font6 setBackgroundColor:[UIColor yellowColor]];
    [font6 setTextColor:[UIColor blackColor]];
    font6.font = [UIFont systemFontOfSize:17];
    font6.text = @"17号字abc";
    [self.view addSubview:font6];
    
    UILabel * font7 = [[UILabel alloc]init];
    [font7 setFrame:CGRectMake(20, 260, 280, 30)];
    [font7 setBackgroundColor:[UIColor yellowColor]];
    [font7 setTextColor:[UIColor blackColor]];
    font7.font = [UIFont systemFontOfSize:18];
    font7.text = @"18号字abc";
    [self.view addSubview:font7];
    
    UILabel * font8 = [[UILabel alloc]init];
    [font8 setFrame:CGRectMake(20, 300, 280, 30)];
    [font8 setBackgroundColor:[UIColor yellowColor]];
    [font8 setTextColor:[UIColor blackColor]];
    font8.font = [UIFont systemFontOfSize:19];
    font8.text = @"19号字abc";
    [self.view addSubview:font8];
    
    UILabel * font9 = [[UILabel alloc]init];
    [font9 setFrame:CGRectMake(20, 340, 280, 30)];
    [font9 setBackgroundColor:[UIColor yellowColor]];
    [font9 setTextColor:[UIColor blackColor]];
    font9.font = [UIFont systemFontOfSize:20];
    font9.text = @"20号字abc";
    [self.view addSubview:font9];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

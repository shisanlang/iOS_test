//
//  arrayViewController.m
//  array
//
//  Created by shisan lang on 11-10-10.
//  Copyright 2011年 BeiJingChaoYangQu. All rights reserved.
//

#import "arrayViewController.h"

@implementation arrayViewController

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
//    NSArray * array = [[NSArray alloc] initWithObjects:@"a",@"b",@"c", nil];
//    NSLog(@"count=%d",[array count]);
//    [array release];
//    NSMutableArray *array2 = [[NSMutableArray alloc]initWithCapacity:3];
//    [array2 addObject:@"1"];
//    [array2 insertObject:@"3" atIndex:1];
//    NSLog(@"array2=%@",array2);
    
//    NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
//    [dic setObject:11 forKey:1];
//    
//    NSLog(@"%@",[[dic objectForKey:1] objectForKey:2]);
	
	//内存控制
	NSMutableArray* urlArray = [[NSMutableArray alloc]init];
	NSString * url = [NSString stringWithFormat:@"%@%@%@%d%@%d%@%@%@",
                      @"http://wiapi.hexun.com/news/gethp.php?id=100000001&device=iPad&deviceid=",
                      [[UIDevice currentDevice]uniqueIdentifier],
                      @"&screenWidth=",20,
                      @"&screenHeight=",30,
                      @"&app=NewsHD-iPad&appName=%BA%CD%D1%B6%B2%C6%BE%AD%D0%C2%CE%C5HD&version=",
                      [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"],
                      @"&build=2011021516"];
	NSLog(@"count = %d,%d",[url retainCount],[urlArray retainCount]);
	[urlArray addObject:url];
	NSLog(@"count = %d,%d",[url retainCount],[urlArray retainCount]);
	[url release];
	NSLog(@"count = %d,%d",[url retainCount],[urlArray retainCount]);
	
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

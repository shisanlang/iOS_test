//
//  networkViewController.m
//  network
//
//  Created by shisan lang on 11-10-24.
//  Copyright 2011年 BeiJingChaoYangQu. All rights reserved.
//

#import "networkViewController.h"


@implementation networkViewController

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
    [super viewDidLoad];
    NSString *urlstr = @"http://www.baidu.com/你好";
    NSStringEncoding gb2312Encode = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    NSString *urlstr2 = [urlstr stringByReplacingPercentEscapesUsingEncoding:gb2312Encode];
    NSLog(@"url=%@",[urlstr2 stringByAddingPercentEscapesUsingEncoding:gb2312Encode]);//NSUTF8StringEncoding
    //ReplacingPercentEscapesUsingEncoding:
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

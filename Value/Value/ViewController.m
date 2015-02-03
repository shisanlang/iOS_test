//
//  ViewController.m
//  Value
//
//  Created by duan on 12-11-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@"v1 = %d,%i",0/7,8/7);
    //取余
    NSLog(@"v2 = %d",7%8);
    
    //
    NSLog(@"%d,%d,%d,%d",[@"" intValue],[@"null" intValue],[@"23df5" intValue],[@"abc43" intValue]);
    
    //去0 %.f
    float i = 312.0102305600012345600;
    NSLog(@"i = %@",[NSString stringWithFormat:@"%A",i]);
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end

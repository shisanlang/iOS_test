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
    
    //
    id result = nil;
    if ([result[@"errorcode"] intValue] == 0) {
        NSLog(@"aaa");
    } else {
        NSLog(@"bbb");
    }
    
    //string to 16
    NSString * hexString = @"ffafe7";//65143
//    unsigned long long hex = 0;
//    NSScanner *scanner = [NSScanner scannerWithString:hexString];
//    BOOL b1 = [scanner scanHexLongLong:&hex];
    
    NSUInteger hex = strtoul([hexString UTF8String],0,16);
    
    
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

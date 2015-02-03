//
//  ViewController.m
//  const
//
//  Created by dxd on 14-8-21.
//  Copyright (c) 2014年 dxd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
            

@end


@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray * sortByArray = @[
                              [NSString stringWithUTF8String:NR_CONST_SORT[0]],
                              [NSString stringWithUTF8String:NR_CONST_SORT[1]],
                              [NSString stringWithUTF8String:NR_CONST_SORT[2]]
                              ];
    NSLog(@"pi = %f",G_PI);
    V_II = 13123;
    NSLog(@"v_i = %d",V_II);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

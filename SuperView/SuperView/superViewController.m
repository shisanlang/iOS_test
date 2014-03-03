//
//  superViewController.m
//  SuperView
//
//  Created by dxd on 14-3-3.
//  Copyright (c) 2014年 dxd. All rights reserved.
//

#import "superViewController.h"

@interface superViewController ()

@end

@implementation superViewController

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
	// Do any additional setup after loading the view.
    NSLog(@"super viewDidLoad");
}

- (void)superDoSthing
{
    NSLog(@"super dongsomething");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

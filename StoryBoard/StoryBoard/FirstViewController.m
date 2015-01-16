//
//  FirstViewController.m
//  StoryBoard
//
//  Created by dxd on 14-9-28.
//  Copyright (c) 2014年 dxd. All rights reserved.
//

#import "FirstViewController.h"
#import "XibViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    /*
     CCCompeletViewController *compeletVc  = [self.storyboard instantiateViewControllerWithIdentifier:@"CompeletViewController"];
     compeletVc.flag = 0;
     [self.navigationController pushViewController:compeletVc animated:YES];
     */
    
}

- (IBAction)goXib:(id)sender {
     XibViewController *xibVC = [[XibViewController alloc] initWithNibName:@"XibViewController" bundle:nil];
    [self.navigationController pushViewController:xibVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

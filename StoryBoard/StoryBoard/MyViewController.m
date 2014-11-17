//
//  MyViewController.m
//  StoryBoard
//
//  Created by dxd on 14-11-7.
//  Copyright (c) 2014年 dxd. All rights reserved.
//

#import "MyViewController.h"
#import "AboutViewController.h"

@interface MyViewController ()

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}

- (IBAction)actionPush:(id)sender {
    AboutViewController *aboutVC  = [self.storyboard instantiateViewControllerWithIdentifier:@"aboutSid"];
    [self.navigationController pushViewController:aboutVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

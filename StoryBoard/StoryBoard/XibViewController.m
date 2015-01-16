//
//  XibViewController.m
//  StoryBoard
//
//  Created by dxd on 14/12/25.
//  Copyright (c) 2014年 dxd. All rights reserved.
//

#import "XibViewController.h"
#import "SecondViewController.h"

@interface XibViewController ()

@end

@implementation XibViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)goStoryBoard:(id)sender {
    
    UIStoryboard *mainSB = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SecondViewController *secondVC  = [mainSB instantiateViewControllerWithIdentifier:@"secondVC_SID"];
    [self.navigationController pushViewController:secondVC animated:YES];
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

//
//  ViewController.m
//  randdom
//
//  Created by dxd on 14-2-21.
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
    
    NSArray *photoArray = [NSArray arrayWithObjects:@"user_100_100_1_101302.jpg",
                           @"user_100_100_1_101459.jpg",
                           @"user_100_100_1_101660.jpg",
                           @"user_100_100_1_118834.jpg",
                           @"user_100_100_1_118881.jpg",
                           @"user_100_100_1_118896.jpg",
                           @"user_100_100_1_119042.jpg",
                           @"user_100_100_1_119063.jpg",
                           @"user_100_100_1_119105.jpg",
                           @"user_100_100_1_119122.jpg",
                           @"user_100_100_1_119509.jpg",
                           @"user_100_100_1_119693.jpg",
                           @"user_100_100_1_119864.jpg",
                           @"user_100_100_1_119966.jpg",
                           @"user_100_100_1_120092.jpg",
                           @"user_100_100_1_120154.jpg",
                           @"user_100_100_1_120291.jpg",
                           @"user_100_100_1_123658.jpg",
                           @"user_100_100_1_133168.jpg",
                           nil];
    for (int i=0; i<2; i++) {
        for (int j=0; j<4; j++) {
            
            UIImageView * photoView = [[UIImageView alloc]init];
            photoView.frame = CGRectMake(30+(20+50)*j, 230+(50+20)*i+20, 50, 50);
            photoView.image = [UIImage imageNamed:[photoArray objectAtIndex:arc4random() % [photoArray count]]];
            [self.view addSubview:photoView];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

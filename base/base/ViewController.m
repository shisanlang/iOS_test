//
//  ViewController.m
//  base
//
//  Created by duan on 13-6-8.
//  Copyright (c) 2013年 duan. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

@synthesize user=_user;//


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    
    user = @"dxd";
    self.user = @"xd";
    _user = @"123";
    
    
//    NSLog(@"view:%@",_user);
    NSLog(@"user = %@,%d",self.user,[user retainCount]);
    
    
    //
//    for (int i = 0; i < 20; i++)
//    {
//        NSString *string = @"Abc";
//        string = [string lowercaseString];
//        string = [string stringByAppendingString:@"xyz"];
//        NSLog(@"%@,%d", string,[string retainCount]);
//    }
    
    
    //2
    
    
    
    //3
    
}

//- (void)setUser:(NSString *)username
//{
//    user = @"summer";
//    NSLog(@"set");
//}
//
//- (NSString *)user
//{
//    _user = @"new user";
//    return _user;
//}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
//    [_user release];
    [super dealloc];
}

@end

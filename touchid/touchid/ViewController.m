//
//  ViewController.m
//  touchid
//
//  Created by dxd on 15/3/18.
//  Copyright (c) 2015年 dxd. All rights reserved.
//

#import "ViewController.h"
#import "LocalAuthentication/LAContext.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    LAContext *myContext = [[LAContext alloc] init];
    NSError *authError = nil;
    NSString *myLocalizedReasonString = @"请输入指纹222";
    
    if ([myContext canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&authError]) {
        NSLog(@"可以验证");
        [myContext evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
                  localizedReason:myLocalizedReasonString
                            reply:^(BOOL success, NSError *error) {
                                if (success) {
                                    NSLog(@"验证成功");
                                    NSLog(@"%@",myLocalizedReasonString);
                                } else {
                                    NSLog(@"验证失败");
                                    NSLog(@"err = %@",error);
                                }
                            }];
    } else {
        NSLog(@"不能验证");
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

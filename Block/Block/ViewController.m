//
//  ViewController.m
//  Block
//
//  Created by duan on 13-5-30.
//  Copyright (c) 2013年 duan. All rights reserved.
//

#import "ViewController.h"
#import "DxdsButton.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize memberVariable;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//    int x = 123;
//    void (^printXy)(int) = ^(int y) {
//        printf("%d %d",x , y);
//    };
//    printXy(456);
    
    UIButton *but = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    but.frame = CGRectMake(20, 20, 80, 50);
    [but setTitle:@"but" forState:UIControlStateNormal];

    [but handleControlEvent:UIControlEventTouchUpInside withBlock:^(id sender){NSLog(@"123");}];
    [self.view addSubview:but];
    
    
    //2
    [self testAccessVariable];

    
    //3
//    int x = 123;
//    void (^printXAndY)(int) = ^(int y) {
//        x = x + y; // error
//        printf("%d %d\n", x, y);
//    };
}

- (void)testAccessVariable
{
    NSInteger outsideVariable = 10;
//    __block NSInteger outsideVariable = 10;
    NSMutableArray * outsideArray = [[NSMutableArray alloc] init];
    
    void (^blockObject)(void) = ^(void){
        NSInteger insideVariable = 20;
        NSLog(@"  > member variable = %d", self.memberVariable);
        NSLog(@"  > outside variable = %d", outsideVariable);
        NSLog(@"  > inside variable = %d", insideVariable);
        
        [outsideArray addObject:@"AddedInsideBlock"];
    };
    
    outsideVariable = 30;
    self.memberVariable = 30;
    
    blockObject();
    
    NSLog(@"  > %d items in outsideArray", [outsideArray count]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

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
    NSLog(@"int = %ld",sizeof(int));
    
    
    //3
    int a[3][4] = {{1,2,3,4},{5,6,7,8},{9,10,11,12}};
    printf("%d\n",*a[0]);//1
    printf("%d\n",a[1][3]);//8
//    printf("%d\n",**a(a+0));
//    printf("%d\n",*(*a(a+1)+2));
    
    void *p=malloc(100);
    char str[100]="hello.";
    char *str1="hello.";
    printf("%d %d  %d",sizeof(p),sizeof(str),sizeof(str1));//4 100 4
    
    int i=0x16;
    NSLog(@"i - 7 = %d",i - 7);
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

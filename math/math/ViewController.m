//
//  ViewController.m
//  math
//
//  Created by duan on 13-8-22.
//  Copyright (c) 2013年 duan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize str=_str;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //1
    int inti = 1;
//    NSLog(@"i = %li", sizeof(inti));      //4
    
    
    //2
    unsigned char * s  = "12345ab11";
//    printf("%li",sizeof(s));
    unsigned int i = (unsigned int)s;
//    printf("%s,%i",*s,i);
    
    //3
    char ss[100] = "1123";
//    printf("%li",sizeof(ss));               //100
    
    //4
    char s3[] = "1123";
//    printf("%li",sizeof(s3));                  //5
    
    //5
    NSString *schemeurl = [[NSMutableString alloc] initWithString:@"hosturl"];
//    NSString *schemeurl = [[NSString alloc] initWithString:@"hosturl"];
    
    NSString    *temp1 = nil;
    NSString    *temp2 = nil;
    NSString    *temp3 = nil;
    
    temp1 = schemeurl;
    temp2 = [schemeurl retain];
    temp3 = [schemeurl copy];
    
//    NSLog(@"*schemeurl = %p", schemeurl);//schemeurl内容所在的内存地址
//    NSLog(@"schemeurl = %p", &schemeurl);//schemeurl变量本身的地址
//    
//    NSLog(@"*temp1 = %p", temp1);
//    NSLog(@"temp1 = %p", &temp1);
//    
//    NSLog(@"*temp2 = %p", temp2);
//    NSLog(@"temp2 = %p", &temp2);
//    
//    NSLog(@"*temp3 = %p", temp3);
//    NSLog(@"temp3 = %p", &temp3);
//
//    
//    //
//    schemeurl = @"123";
//    NSLog(@"*schemeurl = %p", schemeurl);//schemeurl内容所在的内存地址
//    NSLog(@"schemeurl = %p", &schemeurl);//schemeurl变量本身的地址
//    
//    NSLog(@"*temp1 = %p", temp1);
//    NSLog(@"temp1 = %p", &temp1);
//    
//    NSLog(@"*temp2 = %p", temp2);
//    NSLog(@"temp2 = %p", &temp2);
//    
//    NSLog(@"*temp3 = %p", temp3);
//    NSLog(@"temp3 = %p", &temp3);
    
    //
//    schemeurl = @"serverurl";
//    [schemeurl release];
//    [schemeurl release];
//    [schemeurl release];
//    schemeurl = nil;

//    NSLog(@"*schemeurl = %@,%d", schemeurl,schemeurl.retainCount);//schemeurl内容所在的内存地址
//    NSLog(@"*temp1 = %@", temp1);
//    NSLog(@"*temp2 = %@", temp2);
//    NSLog(@"*temp3 = %@", temp3);
    
    //6
    self.name = @"aaa";
    [self bbb:@"aab"];
//    NSLog(@"self.name = %@,%@",self.name,self.aaa);
    
    //7
    self.str = @"aaa";
//    NSLog(@"str = %@",_str);
    
    
    //8
//    [self performSelectorOnMainThread:<#(SEL)#> withObject:<#(id)#> waitUntilDone:<#(BOOL)#>];
//    [self performSelectorInBackground:<#(SEL)#> withObject:<#(id)#>];
//    [self performSelector:<#(SEL)#> withObject:<#(id)#> afterDelay:<#(NSTimeInterval)#>];
//    [self performSelector:<#(SEL)#> onThread:<#(NSThread *)#> withObject:<#(id)#> waitUntilDone:<#(BOOL)#>];
    
    //9
    NSMutableArray* ary = [[NSMutableArray array] retain];
    NSString *str = [NSString stringWithFormat:@"test"];
    [str retain];
    [ary addObject:str];
//    NSString * str = @"123";
//    NSLog(@"%@,%d",str,[str retainCount]);
//    [str retain];
//    [str release];
//    [str release];
//    NSLog(@"%@,%d",str,[str retainCount]);
//    [ary removeAllObjects];
//    NSLog(@"%@,%d",str,[str retainCount]);
    
    //10
    NSString*obj = [[NSData alloc] init];
    
    //11
    char a[] = "hello world!";
    char *p = a;
//    NSLog(@"%ld", sizeof(a));   //13
//    NSLog(@"%ld", sizeof(p));   //4
    
    //12
    
    int x = 3, y = 10, z = test(x, y);
//    NSLog(@"%d,%d", x++, ++z);      //3,131
    
    //13
    int someLargeNumber=4;
    for (int i = 0; i < someLargeNumber; i++)
    {
        NSString *string = @"Abc";
        string = [string lowercaseString];
        string = [string stringByAppendingString:@"xyz"];
//        NSLog(@"%@,%d", string,[string retainCount]);
    }

    //14

    
    
}

int test(int x, int y){    x = x + y;    return x * y;}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  ViewController.m
//  KVC
//
//  Created by duan on 13-12-5.
//  Copyright (c) 2013年 duan. All rights reserved.
//

#import "ViewController.h"





@interface AuthorData : NSObject {
    NSString * name;
}
@end
@implementation AuthorData
@end

@interface BookData : NSObject {
    NSString * bookName;
    float price;
    AuthorData * author;
}
@property(nonatomic,retain) NSString * bookName;//dxd add
@end
@implementation BookData
@synthesize bookName;//dxd add
@end


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    BookData * book1 = [[BookData alloc] init];
    [book1 setValue:@"english" forKey:@"bookName"];
    [book1 setValue:@"20.0" forKey:@"price"];
    AuthorData * author1 = [[AuthorData alloc] init];
    [author1 setValue:@"tom" forKey:@"name"];
    [book1 setValue:author1 forKey:@"author"];
    
    NSLog(@"value=%@,%@",[book1 valueForKey:@"bookName"],book1.bookName);
    NSLog(@"price=%f",[[book1 valueForKey:@"price"] floatValue]);
    NSLog(@"author=%@",[book1 valueForKeyPath:@"author.name"]);
    [book1 release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

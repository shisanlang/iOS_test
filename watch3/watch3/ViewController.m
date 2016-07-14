//
//  ViewController.m
//  watch3
//
//  Created by 十三郎 on 16/7/7.
//  Copyright © 2016年 QianHai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

#define DOCUMENT_PATH [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray * stocklist = @[
                            @{@"code":@"830899.oc",@"name":@"联讯证券"},
                            @{@"code":@"831056.oc",@"name":@"千叶药包"},
                            @{@"code":@"833325.oc",@"name":@"德迈斯"}
                            ];
    [[NSUserDefaults standardUserDefaults] setObject:stocklist forKey:@"stock"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
//    NSLog(@"DOCUMENT_PATH = %@",DOCUMENT_PATH);
    
    NSFileManager* fileManager = [NSFileManager defaultManager];
    NSURL* storeUrl = [fileManager containerURLForSecurityApplicationGroupIdentifier:@"group.com.neeqm.watch3"];
    storeUrl = [storeUrl URLByAppendingPathComponent:@"local_mystock.plist"];
    if (![fileManager fileExistsAtPath:storeUrl.path]) {
        NSError * error = nil;
        NSURL * sUrl = [[NSBundle mainBundle] URLForResource:@"local_mystock" withExtension:@"plist"];
        BOOL b = [fileManager copyItemAtURL:sUrl toURL:storeUrl error:&error];
//        NSLog(@"b=%@",b?@"yes":@"no");
    }
    NSLog(@"%@", storeUrl);
}


- (NSString*)filenameWithMyLocalStock {
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (![fileManager fileExistsAtPath:DOCUMENT_PATH]) {
        [fileManager createDirectoryAtPath:DOCUMENT_PATH withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    NSString * filename = [DOCUMENT_PATH stringByAppendingPathComponent:@"local_mystock.plist"];

    BOOL isDir;
    if (![fileManager fileExistsAtPath:filename isDirectory:&isDir]) {
        NSString *bundlePath = [[NSBundle mainBundle]pathForResource:@"local_mystock" ofType:@"plist"];
        [fileManager copyItemAtPath:bundlePath toPath:filename error:nil];
    }
    
    return filename;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

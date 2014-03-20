//
//  ViewController.m
//  NSUserDefaults
//
//  Created by dxd on 14-3-20.
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
    [[NSUserDefaults standardUserDefaults] setObject:@"123" forKey:@"key1"];
    [[NSUserDefaults standardUserDefaults] stringForKey:@"key1"];
    
    NSLog(@"key = %@", [NSUserDefaults standardUserDefaults].dictionaryRepresentation.allKeys);
    /*
     key = (
     key1,
     AppleKeyboardsExpanded,
     AppleLanguages,
     AppleITunesStoreItemKinds,
     AppleLocale,
     AppleKeyboards,
     NSLanguages,
     UIDisableLegacyTextView,
     NSInterfaceStyle
     )
    */
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"key1"];
    
    NSLog(@"key = %@", [NSUserDefaults standardUserDefaults].dictionaryRepresentation.allKeys);
    /*
     key = (
     AppleLanguages,
     AppleKeyboardsExpanded,
     UIDisableLegacyTextView,
     AppleITunesStoreItemKinds,
     AppleLocale,
     AppleKeyboards,
     NSLanguages,
     NSInterfaceStyle
     )
     */
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

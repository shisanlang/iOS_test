//
//  ViewController.m
//  progress
//
//  Created by duan on 13-12-5.
//  Copyright (c) 2013年 duan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self fooNoInputs];
    [self performSelector:@selector(fooNoInputs)];
    [self performSelector:@selector(fooOneInput:) withObject:@"first"];
    [self performSelector:@selector(fooFirstInput:secondInput:) withObject:@"first"withObject:@"second"];
    
    
//    [self performSelector:<#(SEL)#> withObject:<#(id)#>];
//    [self performSelector:<#(SEL)#> withObject:<#(id)#> afterDelay:<#(NSTimeInterval)#>];
//    [self performSelector:<#(SEL)#> onThread:(NSThread *) withObject:<#(id)#> waitUntilDone:<#(BOOL)#>];
//    [self performSelectorInBackground:<#(SEL)#> withObject:<#(id)#>];
//    [self performSelectorOnMainThread:<#(SEL)#> withObject:<#(id)#> waitUntilDone:<#(BOOL)#>];
}

- (void) fooNoInputs {
    NSLog(@"Does nothing");
}

- (void) fooOneInput:(NSString*) first {
    NSLog(@"Logs %@", first);
}

- (void) fooFirstInput:(NSString*) first secondInput:(NSString*) second {
    NSLog(@"Logs %@ then %@", first, second);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  dicViewController.m
//  dic
//
//  Created by shisan lang on 11-9-13.
//  Copyright 2011年 BeiJingChaoYangQu. All rights reserved.
//

#import "dicViewController.h"

@implementation dicViewController

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    NSMutableDictionary * dic  = [[[NSMutableDictionary alloc]init] autorelease];
    [dic setObject:@"a1" forKey:@"1"];
    [dic setObject:@"b1" forKey:@"2"];
    [dic setObject:@"c1" forKey:@"3"];
    [dic setObject:@"d1" forKey:@"4"];
    [dic setObject:@"e1" forKey:@"1"];
    [dic setObject:@"f1" forKey:@"1"];
    [dic setObject:@"g1" forKey:@"1"];
    
    for (NSString * str in dic) {
        NSLog(@"%@=%@",str,[dic objectForKey:str]);
    }
    
    NSLog(@"dic count=%d",[dic count]);
    
    NSLog(@"dic=%@",[dic allValues]);
    
    [dic removeObjectForKey:@"13"];
    
    NSArray * arr = [NSArray arrayWithObjects:@"北京",@"上海",@"广州",nil];
    
    NSString * strArray = @"array";
    [dic setObject:arr forKey:strArray];
    
    NSLog(@"dic=%@",dic);
    
    [dic writeToFile:[self GetFileName] atomically:YES];
    [super viewDidLoad];
}

- (NSString *) GetFileName {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0]; 
    NSString *filename = [documentsDirectory stringByAppendingPathComponent:@"localstock.plist"];
    NSLog(@"filename=%@",filename);
    return filename;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

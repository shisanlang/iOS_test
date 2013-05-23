//
//  buttonViewController.m
//  button
//
//  Created by shisan lang on 11-8-4.
//  Copyright 2011年 BeiJingChaoYangQu. All rights reserved.
//

#import "buttonViewController.h"

@implementation buttonViewController

//@property picker;

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
    /**/
    
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self 
               action:@selector(dodo:)
				forControlEvents:UIControlEventTouchDown];//UIControlEventTouchDown
    [button setTitle:@"Show View" forState:UIControlStateNormal];
    button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
    button.font=[UIFont systemFontOfSize:12];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithRed:0 green:64 blue:128 alpha:1.0] forState:UIControlStateHighlighted];
    
    [button setBackgroundImage:[UIImage imageNamed:@"time-n.png"] forState:UIControlStateNormal];
//    button.backgroundColor = [UIColor colorWithRed:.15 green:0.16 blue:0.23 alpha:1.0];
//    [button setImage:[UIImage imageNamed:@"time-n.png"] forState:UIControlStateNormal];
//    [button setImage:[UIImage imageNamed:@"time-h.png"] forState:UIControlStateSelected];
//    [button setImage:[UIImage imageNamed:@"time-h.png"] forState:UIControlStateHighlighted];
    
    [self.view addSubview:button];
    /**/
	picker.delegate = self;  //指定Delegate
	picker.showsSelectionIndicator = YES;

    [super viewDidLoad];
    
}

-(void) dodo:(id)sender{
    NSLog(@"dodo:");
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"dxd://id=1209&name=me&cc=helloworld!"]];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView //返回列数
{
	return 2;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component //返回每列的最大行数
{
	return 10;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component //每一列中每一行的具体内容
{
	return @"vv";
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component //选中哪一列哪一行
{
	NSLog(@"row = %d");
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

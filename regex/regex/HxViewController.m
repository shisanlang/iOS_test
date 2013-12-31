//
//  HxViewController.m
//  regex
//
//  Created by lang shisan on 12-2-21.
//  Copyright (c) 2012年 BeiJingChaoYangQu. All rights reserved.
//

#import "HxViewController.h"

@implementation HxViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	NSString *searchString  = @ "This is neat." ;  
	NSString *regexString   = @"(\\w+)\\s+(\\w+)\\s+(\\w+)" ;  
	NSString *matchedString = [searchString stringByMatching:regexString capture:1L];  
	NSLog(@"matchedString: '%@'" , matchedString);  
	
    //判断空白字符串
    NSLog(@"是否空串 = %@",[self isBlankString:@"  \n "]?@"是":@"否");
    

    
	
//	NSString *searchString  = @"<result><status><is_success>1</is_success><has_record>1</has_record><status_code>REQUST_SUCCESS</status_code><record_count>1</record_count></status><data><user><user_id>18689775</user_id><user_name>dxdtest3</user_name><blog_name>18689775</blog_name><sex>3</sex><user_url>http://t.hexun.com/18689775/default.html</user_url><user_logo>http://logo3.tool.hexun.com/1ef2e1d-75.jpg</user_logo><zone/><city/><intro/><realname_verify>3</realname_verify><follow_count>1</follow_count><followed_count>1</followed_count><article_count>0</article_count></user></data></result>";
//	NSString *regexString   = @"[\\s\\S]*<realname_verify>(-?\\d)<\\/realname_verify>[\\s\\S]*" ;  
//	NSString *matchedString = [searchString stringByMatching:regexString capture:1L];  
//	NSLog(@"matchedString: '%@'" , matchedString); 
	
    
    //
    NSString * strAll = @"abcsdfjjfwjleabcdef12389";
    NSString * str1 = @"abcd";
    BOOL strAllHasStr= [strAll hasPrefix:str1];
    NSLog(@"strAllHasStr = %d",strAllHasStr);
}

-(BOOL)isBlankString:(NSString *)string{ 
    
    if (string == nil || string == NULL || [string isKindOfClass:[NSNull class]] ) { 
        return YES; 
        
    } 
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0) { 
        return YES; 
    } 
    return NO;
} 

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
	    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
	} else {
	    return YES;
	}
}

@end

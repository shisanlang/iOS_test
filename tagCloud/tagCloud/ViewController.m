//
//  ViewController.m
//  tagCloud
//
//  Created by dxd on 14-3-10.
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

    //1
//    [self loadDocument:@"1.html"];
    
    //2.
    [self loadHtml];
}

//2.
-(void)loadHtml
{
    UIWebView * WebView = [[UIWebView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [WebView setBackgroundColor:[UIColor clearColor]];
    [WebView setDelegate:self];
    [self.view addSubview:WebView];
    
    NSURL *baseURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"tagcanvas-example" ofType:@"html"];
    NSString *html = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    [WebView loadHTMLString:html baseURL:baseURL];
}


//1.
-(void)loadDocument:(NSString *)docName
{
    
    UIWebView *iWebView = [[UIWebView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.view addSubview:iWebView];
    
    NSString *mainBundleDirectory=[[NSBundle mainBundle] bundlePath];
    NSString *path=[mainBundleDirectory stringByAppendingPathComponent:docName];
    
    NSURL *url=[NSURL fileURLWithPath:path];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    iWebView.scalesPageToFit=YES;
    [iWebView loadRequest:request];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

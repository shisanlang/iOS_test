//
//  ViewController.m
//  webview
//
//  Created by duan on 13-5-16.
//  Copyright (c) 2013年 duan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize webView;
@synthesize NewsArray;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //data
    self.NewsArray = [NSArray arrayWithObjects:
                          //中文
                          [NSArray arrayWithObjects:@"华尔街日报",@"http://m.cn.wsj.com/",nil],
                          [NSArray arrayWithObjects:@"财富/福布斯",@"http://www.fortunechina.com/ ",nil],
                          [NSArray arrayWithObjects:@"朝日新闻",@"http://asahichinese.com/",nil],
                          [NSArray arrayWithObjects:@"日本经济新闻",@"http://cn.nikkei.com/",nil],
                 
                          //美国
                          [NSArray arrayWithObjects:@"时代周刊",@"http://mobile.time.com/",nil],
                          [NSArray arrayWithObjects:@"今日美国",@"http://www.usatoday.com/mobile/",nil],
                          [NSArray arrayWithObjects:@"华尔街日报",@"http://m.wsj.com/",nil],
                          [NSArray arrayWithObjects:@"时代周刊",@"http://mobile.time.com/",nil],
                 
                          //英国
                          [NSArray arrayWithObjects:@"金融时报",@"http://www.ftchinese.com/",nil],
                      
                          //日本
                          [NSArray arrayWithObjects:@"朝日新闻",@"http://www.asahi.com/",nil],
                          
                          nil];
        
    //scroll
    UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
    scroll.contentSize  = CGSizeMake(10+10+self.NewsArray.count*(10+100), 40);
    [self.view addSubview:scroll];
    
    //but
    for (int i=0; i<self.NewsArray.count; i++) {
        UIButton *but = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        but.frame = CGRectMake(10+(100+10)*i, 5, 100, 30);
        [but setTitle:[[self.NewsArray objectAtIndex:i] objectAtIndex:0] forState:UIControlStateNormal];
        but.tag = i;
        [but addTarget:self action:@selector(Refresh:) forControlEvents:UIControlEventTouchUpInside];
        [scroll addSubview:but];
    }
    
    //web
    webView = [[UIWebView alloc]init];
    webView.frame = self.view.frame;
    webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, scroll.frame.size.height, self.view.frame.size.width, self.view.frame.size.height-scroll.frame.size.height)];
    [webView setBackgroundColor:[UIColor clearColor]];
    [webView setDelegate:self];
    [self.view addSubview:webView];
    
    //
    [scroll release];
    
    //
    UIButton * ButTag = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    ButTag.tag = 0;
    [self Refresh:ButTag];
}

- (void)Refresh:(id)sender
{
    UIButton *but = (UIButton *)sender;
    int NewsIndex = but.tag ? but.tag : 0;
    NSURL *url = [NSURL URLWithString:[[self.NewsArray objectAtIndex:NewsIndex] objectAtIndex:1]];
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

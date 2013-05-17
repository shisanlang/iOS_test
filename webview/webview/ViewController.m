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

@synthesize WebView;
@synthesize NewsArray;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //data
    self.NewsArray = [NSArray arrayWithObjects:
                          //中文
                          [NSArray arrayWithObjects:@"华尔街日报(中)",@"http://m.cn.wsj.com/",nil],
//                          [NSArray arrayWithObjects:@"财富/福布斯",@"http://www.fortunechina.com/ ",nil],
//                          [NSArray arrayWithObjects:@"朝日新闻",@"http://asahichinese.com/",nil],
//                          [NSArray arrayWithObjects:@"日本经济新闻",@"http://cn.nikkei.com/",nil],
                      
                          //英国
                          [NSArray arrayWithObjects:@"金融时报(中)",@"http://www.ftchinese.com/",nil],
                      
                          //美国
                          [NSArray arrayWithObjects:@"今日美国",@"http://www.usatoday.com/mobile/",nil],
                          [NSArray arrayWithObjects:@"华尔街日报",@"http://m.wsj.com/",nil],
                          [NSArray arrayWithObjects:@"时代周刊",@"http://mobile.time.com/",nil],
                 
                          
                      
                          //日本
                          [NSArray arrayWithObjects:@"朝日新闻",@"http://dot.asahi.com/",nil],
                          
                          nil];
        
    //scroll
    UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
    scroll.showsHorizontalScrollIndicator = NO;
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
    WebView = [[UIWebView alloc]init];
//    webView.scrollView.bounces = NO;
    WebView.frame = self.view.frame;
    WebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, scroll.frame.size.height, self.view.frame.size.width, XD_SCREENHEIGHT-self.navigationController.navigationBar.frame.size.height-scroll.frame.size.height)];
    [WebView setBackgroundColor:[UIColor clearColor]];
    [WebView setDelegate:self];
    [self.view addSubview:WebView];
    
    //
    [scroll release];
    
    //
    UIButton * ButTag = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    ButTag.tag = 0;
    [self Refresh:ButTag];
    
    //
    for (id subview in WebView.subviews){
        if ([[subview class] isSubclassOfClass:[UIScrollView class]]) {
            ((UIScrollView *)subview).bounces = NO;
            
        }
        
    }
    
    //
    BackButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    BackButton.frame = CGRectMake(20, XD_SCREENHEIGHT - 50-self.navigationController.navigationBar.frame.size.height, 60, 30);
    [BackButton setTitle:@"<" forState:UIControlStateNormal];
    [BackButton addTarget:self action:@selector(goBackButton:) forControlEvents:UIControlEventTouchUpInside];
    ForwardButton.enabled = NO;
    [self.view addSubview:BackButton];
    
    ForwardButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    ForwardButton.frame = CGRectMake(100, XD_SCREENHEIGHT-50-self.navigationController.navigationBar.frame.size.height, 60, 30);
    [ForwardButton setTitle:@">" forState:UIControlStateNormal];
    [ForwardButton addTarget:self action:@selector(goForwardButton:) forControlEvents:UIControlEventTouchUpInside];
    ForwardButton.enabled = NO;
    [self.view addSubview:ForwardButton];
    
    
}

- (void)Refresh:(id)sender
{
    
    //
    UIButton *but = (UIButton *)sender;
    int NewsIndex = but.tag ? but.tag : 0;
    NSURL *url = [NSURL URLWithString:[[self.NewsArray objectAtIndex:NewsIndex] objectAtIndex:1]];
    [WebView loadRequest:[NSURLRequest requestWithURL:url]];
    
    
}

- (IBAction)goBackButton:(id)sender
{
    [ForwardButton setEnabled:TRUE];
    [WebView goBack];
}
- (IBAction)goForwardButton:(id)sender
{
    [WebView goForward];
}


//
- (void)webViewDidStartLoad:(UIWebView *)webView//;开始加载的时候执行该方法。
{
    //
    NSLog(@"------%d",[activityIndicatorView retainCount]);
    if (activityIndicatorView) {
        NSLog(@"11");
        [activityIndicatorView stopAnimating];
        [activityIndicatorView removeFromSuperview];
    }
    
    
    activityIndicatorView = [[UIActivityIndicatorView alloc]
                             initWithFrame : CGRectMake(270.0f, 6.0f, 32.0f, 32.0f)] ;
    //    [activityIndicatorView setCenter: self.navigationController.navigationBar.center];
    [activityIndicatorView setActivityIndicatorViewStyle: UIActivityIndicatorViewStyleGray] ;
    [self.navigationController.navigationBar addSubview : activityIndicatorView] ;
    [activityIndicatorView startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView//;加载完成的时候执行该方法。
{
    if (activityIndicatorView) {
        NSLog(@"2");
        [activityIndicatorView stopAnimating];
        [activityIndicatorView removeFromSuperview];
    }
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error//;加载出错的时候执行该方法。
{
    if (activityIndicatorView) {
        NSLog(@"3----%@",error.description);
        [activityIndicatorView stopAnimating];
        [activityIndicatorView removeFromSuperview];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

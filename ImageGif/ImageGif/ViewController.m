//
//  ViewController.m
//  ImageGif
//
//  Created by duan on 13-11-6.
//  Copyright (c) 2013年 duan. All rights reserved.
//

#import "ViewController.h"
#import "GifView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    //1
    CGRect rect =CGRectMake(3,10,100,100);
    rect.size = [UIImage imageNamed:@"gif1.gif"].size;
    
    UIWebView * _webView = [[UIWebView alloc]initWithFrame:rect];
    NSData *imgData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"gif1"ofType:@"gif"]];
    [_webView loadData:imgData MIMEType:@"image/gif"textEncodingName:nil baseURL:nil];
    _webView.userInteractionEnabled =NO;//用不不可交互
    _webView.backgroundColor = [UIColor clearColor];
    _webView.opaque =NO;
    [self.view addSubview:_webView];
    
    
    //2
    rect =CGRectMake(3,300,100,100);
    
    NSMutableArray *resourceArr = [[NSMutableArray alloc]init];
    for (int i =1;i <=2;i++)
    {
        UIImage *pic =nil;
        if (i <10)
        {
            pic = [UIImage imageNamed:[NSString stringWithFormat:@"gif%i.gif",i]];
        }
        else
        {
            pic = [UIImage imageNamed:[NSString stringWithFormat:@"gif%i.gif",i]];
        }
        [resourceArr addObject:pic];
    }
    
    UIImageView *fireImageView = [[UIImageView alloc]initWithFrame:rect];
    fireImageView.animationImages = resourceArr;
    //执行一次完整动画所需时长
    fireImageView.animationDuration =1.75;
    //repeat the animation forever
    fireImageView.animationRepeatCount =0;
    [fireImageView startAnimating];
    [self.view addSubview:fireImageView];
    
    
    //3
    // 网络图片
    //  NSData *urlData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://www.chinagif.com/gif/part/boy/0045.gif"]];
    
    // 本地图片
    NSData *localData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"gif1" ofType:@"gif"]];
    
    GifView *dataView = [[GifView alloc] initWithFrame:CGRectMake(0, 400, 100, 100) data:localData];
    [self.view addSubview:dataView];
//    [dataView release];
    
    // 或者
    
    GifView *pathView =[[GifView alloc] initWithFrame:CGRectMake(100, 400, 100, 100) filePath:[[NSBundle mainBundle] pathForResource:@"gif2" ofType:@"gif"]];
    [self.view addSubview:pathView];
//    [pathView release];
}


//获取图片数据的格式的代码
+ (NSString *)MIMETypeForImageData:(NSData *)data {
    if (!data)return nil;
    
    uint8_t c;
    [data getBytes:&c length:1];
    
    switch (c) {
        case0xFF:
            return@"image/jpeg";
        case0x89:
            return@"image/png";
        case0x47:
            return@"image/gif";
        case0x49:
        case0x4D:
            return@"image/tiff";
    }
    return nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

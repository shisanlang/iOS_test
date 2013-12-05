//
//  ViewController.m
//  snow
//
//  Created by duan on 13-12-5.
//  Copyright (c) 2013年 duan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize pic;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.pic = [UIImage imageNamed:@"snow.jpg"];//初始化图片
    //启动定时器，实现飘雪效果
    [NSTimer scheduledTimerWithTimeInterval:(.2) target:self selector:@selector(ontime) userInfo:nil repeats:YES];
    
}

-(void)ontime{
    UIImageView *view = [[UIImageView alloc] initWithImage:pic];//声明一个UIImageView对象，用来添加图片
    view.alpha = 0.5;//设置该view的alpha为0.5，半透明的
    int x = round(random()%320);//随机得到该图片的x坐标
    int y = round(random()%20);//这个是该图片移动的最后坐标x轴的
    int s = round(random()%20);//这个是定义雪花图片的大小
    NSLog(@",%ld,%d,%d,%d",random(),x,y,s);
    int sp = 1/round(random())+1;//这个是速度
    view.frame = CGRectMake(x, -50, s, s);//雪花开始的大小和位置
    [self.view addSubview:view];//添加该view
    [UIView beginAnimations:nil context:view];//开始动画
    [UIView setAnimationDuration:10*sp];//设定速度
    view.frame = CGRectMake(x, 500, s, s);//设定该雪花最后的消失坐标
    [UIView setAnimationDelegate:self];
    [UIView commitAnimations];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

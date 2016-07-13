//
//  ViewController.m
//  watchAni
//
//  Created by duanxiaodong on 15/6/3.
//  Copyright (c) 2015年 GuoXinHuiJin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

#define dia 100   //直径
#define sep 5     //间隔
#define cx self.view.center.x
#define cy self.view.center.y

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
//    [self.view setUserInteractionEnabled:YES];
//    [self.view addGestureRecognizer:pan];
    
    //
    float x = 0;//画布大小
    float y = 0;
    float w = 320;
    float h = 600;
//    float dia = 100;//直径
//    float cx = self.view.center.x;
//    float cy = self.view.center.y;
    
    //创建
    NSArray * cirArray = @[
                           @{@"color":[UIColor redColor]},
                           @{@"color":[UIColor greenColor]},
                           @{@"color":[UIColor blueColor]},
                           @{@"color":[UIColor cyanColor]},
                           @{@"color":[UIColor brownColor]},
                           @{@"color":[UIColor blackColor]},
                           @{@"color":[UIColor cyanColor]},
                           @{@"color":[UIColor yellowColor]},
                           @{@"color":[UIColor grayColor]},
                           @{@"color":[UIColor magentaColor]},
                           @{@"color":[UIColor orangeColor]},
                           @{@"color":[UIColor purpleColor]}
                           ];
    
    
    for (int i=0; i<50; i++) {//cirArray.count
        UIButton * cirButton = [UIButton buttonWithType:UIButtonTypeCustom];
        cirButton.tag = i;
        cirButton.backgroundColor = [self randomColor];
//        cirButton.backgroundColor = [cirArray[i] objectForKey:@"color"];
        cirButton.frame = CGRectMake(0, 0, dia, dia);
        cirButton.layer.masksToBounds = YES;
        cirButton.layer.cornerRadius = dia/2;
        cirButton.center = CGPointMake([self xNum:i], [self yNum:i]);
        [self.view addSubview:cirButton];
        

//        NSLog(@"第%d圈%d个",i,[self totalWithLap:i]);
//        NSLog(@"%d:第%d圈",i,[self numWithLap:i]);
//        NSLog(@"%d:第%d个",i,[self numPerLap:i]);
//        NSLog(@"%d:%f度/弧度",i,[self radianNum:i]);
//        NSLog(@"坐标:%d=%f,%f",i,[self xNum:i], [self yNum:i]);
    }
}

//一圈几个
- (int)totalWithLap:(int)n {
    return (n==0)?1:360/(60/pow(2, n-1));//根据角度算
}

//第几圈
- (int)numWithLap:(int)n {
    int i = 0;
    while (1) {
        n = n-[self totalWithLap:i];
        if (n<0) {
            break;
        }
        i++;
    }
    return i;
}

//第几圈 第几个
- (int)numPerLap:(int)n {
    int lapNum = [self numWithLap:n]-1;
//    NSLog(@"lam = %d",lapNum);
    for (int i=0; i<=lapNum; i++) {
        n = n - [self totalWithLap:i];
    }
    return n+1;
}

//- (int)gNum:(int)n {
//    NSLog(@"n = %d,%d,%d",n,[self numWithLap:n],[self geNum:[self numWithLap:n]] );
//    return (int)(n-[self geNum:[self numWithLap:n]-1]);
//}

////之前圈几个
//- (int)geNum:(int)n {
//    int cNum = 0;
//    for (int i=0; i<n; i++) {//[self roundNum:n]
//        cNum = cNum + [self totalWithLap:i];//[self roundNum:i]*6;
//    }
////    NSLog(@"cnum %d= %d",n,cNum);
//    return (cNum<0)?0:cNum;
//}

//度数
- (double)radianNum:(int)n {
//    return 360/[self totalWithLap:[self numWithLap:n]] * [self numPerLap:n];
    return 2*M_PI/[self totalWithLap:[self numWithLap:n]] * [self numPerLap:n];
}

//x y
- (double)xNum:(int)i {
    if (i==0) {
        return cx;
    } else {
        //根据 度数，直径 求x,y
        return cos([self radianNum:i]) * (dia+sep)*[self numWithLap:i] +cx;//* (([self radianNum:i]>M_PI_2 && [self radianNum:i]<M_PI_2*3)?1:-1)
    }
}

- (double)yNum:(int)i {
    if (i==0) {
        return cy;
    } else {
        //根据 度数，直径 求x,y
        return sin([self radianNum:i]) * (dia+sep)*[self numWithLap:i] +cy;//* (([self radianNum:i]>M_PI_2 && [self radianNum:i]<M_PI_2*3)?1:-1)
    }
}

//手势
//- (void) handlePan: (UIPanGestureRecognizer *)rec{
////    NSLog(@"xxoo---xxoo---xxoo");
////    CGPoint point = [rec locationInView:self.view];
//    CGPoint point = [rec translationInView:self.view];
////    CGPoint point = [rec velocityInView:self.view];
//    NSLog(@"%f,%f",point.x,point.y);
////    rec.view.center = CGPointMake(rec.view.center.x + point.x, rec.view.center.y + point.y);
////    [rec setTranslation:CGPointMake(0, 0) inView:self.view];
////    [UIView animateWithDuration:.2 animations:^(){
////        
////    }];
//    for (int i=0; i<50; i++) {
//        UIButton * but = (UIButton*)[self.view viewWithTag:i];
//        but.frame = CGRectMake(but.frame.origin.x+point.x, but.frame.origin.y+point.y, but.frame.size.width, but.frame.size.height);
//    }
//    rec.view.center = CGPointMake(rec.view.center.x, rec.view.center.y);
//    [rec setTranslation:CGPointMake(0, 0) inView:self.view];
//
//}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    bPoint = [touch locationInView:self.view];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint mPoint = [touch locationInView:self.view];
    CGPoint point = CGPointMake(mPoint.x-bPoint.x, mPoint.y-bPoint.y);
    
    for (int i=0; i<50; i++) {
        UIButton * but = (UIButton*)[self.view viewWithTag:i];
        but.frame = CGRectMake(but.frame.origin.x+point.x/10, but.frame.origin.y+point.y/10, but.frame.size.width, but.frame.size.height);
    }
}


//随机颜色
-(UIColor *) randomColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 ); //0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0,away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5; //0.5 to 1.0,away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

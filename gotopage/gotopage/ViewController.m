//
//  ViewController.m
//  gotopage
//
//  Created by dxd on 14-7-14.
//  Copyright (c) 2014年 dxd. All rights reserved.
//

#import "ViewController.h"
#import "GotoViewController.h"
#import <CoreText/CoreText.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UILabel * label = [[UILabel alloc]init];
    label.tag = 100;
    label.frame = CGRectMake(0, 100, 280, 40);
    label.backgroundColor = [UIColor lightGrayColor];
    NSMutableAttributedString * publishString = [[NSMutableAttributedString alloc] initWithString:@"招商银行600000今日大涨"];
//    [publishString addAttribute: NSForegroundColorAttributeName value: [UIColor blueColor] range: NSMakeRange(0,10)];
    [publishString addAttribute: NSLinkAttributeName value: @"http://www.google.com" range: NSMakeRange(0, 10)];
    label.attributedText = publishString;
    [self.view addSubview:label];
    
    }


-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    UILabel * label = (UILabel *)[self.view viewWithTag:100];
    CGPoint point = [touch  locationInView:label];
//    NSLog(@"%f,%f",point.x,point.y);
    
    //创建CTFrame,attString为NSMutableAttributedString
    CGMutablePathRef mainPath = CGPathCreateMutable();
    CGPathAddRect(mainPath, NULL, CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height));
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)label.attributedText);
    CTFrameRef ctframe = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), mainPath, NULL);
    CGPathRelease(mainPath);
    
    //取文字行数
    NSArray *lines = (__bridge NSArray *)CTFrameGetLines(ctframe);
    NSInteger lineCount = [lines count];
    CGPoint origins[lineCount];
    
    //判断有文字
    if (lineCount != 0) {
        //每行起始位置
        CTFrameGetLineOrigins(ctframe, CFRangeMake(0, 0), origins);
        
        //每行
        for (int i = 0; i < lineCount; i++) {
            //一行起始坐标
            CGPoint baselineOrigin = origins[i];
            
            //取真正起始y
          	baselineOrigin.y = CGRectGetHeight(self.view.frame) - baselineOrigin.y;
			
			CTLineRef line = (__bridge CTLineRef)[lines objectAtIndex:i];
			CGFloat ascent, descent;
            //取行高,行宽
			CGFloat lineWidth = CTLineGetTypographicBounds(line, &ascent, &descent, NULL);
			//取一行真正面积
			CGRect lineFrame = CGRectMake(baselineOrigin.x, baselineOrigin.y - ascent, lineWidth, ascent + descent);
            //判断点击在不在范围内
            if (CGRectContainsPoint(lineFrame, point)) {
                NSLog(@"%f,%f,%f,%f",lineFrame.origin.x,lineFrame.origin.y,lineFrame.size.width,lineFrame.size.height);
                NSLog(@"%f,%f",point.x,point.y);
                //取被点击字符位置
                CFIndex index = CTLineGetStringIndexForPosition(line, point);
                //                //取所有可以点击的字符range
                //				NSArray *urlsKeys = [_URLs allKeys];
                //				//遍历
                //				for (NSString *key in urlsKeys) {
                //                //判断,如果点击在range内则执行
                //					NSRange range = NSRangeFromString(key);
                //					if (index &gt;= range.location &amp;&amp; index &lt; range.location + range.length) {
                //                        //通过Key取值,要点击的值
                //                        //做动作
                //						break;
                //					}
                //				}
            }
        }
    }
    CFRelease(ctframe);

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

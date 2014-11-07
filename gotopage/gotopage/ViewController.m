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
    label.numberOfLines = 0;
    label.backgroundColor = [UIColor lightGrayColor];
    NSMutableAttributedString * publishString = [[NSMutableAttributedString alloc] initWithString:
                                                 [NSString stringWithFormat:@"%@%@%@",
                                                 @"百度简介",
                                                 @"招商银行600000今日大涨",
                                                 
                                                 @"百度，全球最大的中文搜索引擎、最大的中文网站。2000年1月创立于北京中关村。\n\n1999年底，身在美国硅谷的李彦宏看到了中国互联网及中文搜索引擎服务的巨大发展潜力，抱着技术改变世界的梦想，他毅然辞掉硅谷的高薪工作，携搜索引擎专利技术，于2000年1月1日在中关村创建了百度公司。从最初的不足10人发展至今，员工人数超过17000人。如今的百度，已成为中国最受欢迎、影响力最大的中文网站。\n\n"
//                                                  @"百度拥有数千名研发工程师，这是中国乃至全球最为优秀的技术团队，这支队伍掌握着世界上最为先进的搜索引擎技术，使百度成为中国掌握世界尖端科学核心技术的中国高科技企业，也使中国成为美国、俄罗斯、和韩国之外，全球仅有的4个拥有搜索引擎核心技术的国家之一。\n\n从创立之初，百度便将“让人们最便捷地获取信息，找到所求”作为自己的使命，成立以来，公司秉承“以用户为导向”的理念，不断坚持技术创新，致力于为用户提供“简单，可依赖”的互联网搜索产品及服务，其中包括：以网络搜索为主的功能性搜索，以贴吧为主的社区搜索，针对各区域、行业所需的垂直搜索，Mp3搜索，以及门户频道、IM等，全面覆盖了中文网络世界所有的搜索需求，根据第三方权威数据，百度在中国的搜索份额超过80%。\n\n在面对用户的搜索产品不断丰富的同时，百度还创新性地推出了基于搜索的营销推广服务，并成为最受企业青睐的互联网营销推广平台。目前，中国已有数十万家企业使用了百度的搜索推广服务，不断提升着企业自身的品牌及运营效率。通过持续的商业模式创新，百度正进一步带动整个互联网行业和中小企业的经济增长，推动社会经济的发展和转型。\n\n为推动中国数百万中小网站的发展，百度借助超大流量的平台优势，联合所有优质的各类网站，建立了世界上最大的网络联盟，使各类企业的搜索推广、品牌营销的价值、覆盖面均大面积提升。与此同时，各网站也在联盟大家庭的互助下，获得最大的生存与发展机会。\n\n作为国内的一家知名企业，百度也一直秉承“弥合信息鸿沟，共享知识社会”的责任理念，坚持履行企业公民的社会责任。成立来，百度利用自身优势积极投身公益事业，先后投入巨大资源，为盲人、少儿、老年人群体打造专门的搜索产品，解决了特殊群体上网难问题,极大地弥补了社会信息鸿沟问题。此外，在加速推动中国信息化进程、净化网络环境、搜索引擎教育及提升大学生就业率等方面，百度也一直走在行业领先的地位。2011年初，百度还特别成立了百度基金会，围绕知识教育、环境保护、灾难救助等领域，更加系统规范地管理和践行公益事业。\n\n2005年，百度在美国纳斯达克上市，一举打破首日涨幅最高等多项纪录，并成为首家进入纳斯达克成分股的中国公司。通过数年来的市场表现，百度优异的业绩与值得依赖的回报，使之成为中国企业价值的代表，傲然屹立于全球资本市场。\n\n2009年，百度更是推出全新的框计算技术概念，并基于此理念推出百度开放平台，帮助更多优秀的第三方开发者利用互联网平台自主创新、自主创业，在大幅提升网民互联网使用体验的同时，带动起围绕用户需求进行研发的产业创新热潮，对中国互联网产业的升级和发展产生巨大的拉动效应。\n\n今天，百度已经成为中国最具价值的品牌之一，英国《金融时报》将百度列为“中国十大世界级品牌”，成为这个榜单中最年轻的一家公司，也是唯一一家互联网公司。而“亚洲最受尊敬企业”、“全球最具创新力企业”、“中\n\n多年来，百度董事长兼CEO李彦宏，率领百度人所形成的“简单可依赖”的核心文化，深深地植根于百度。这是一个充满朝气、求实坦诚的公司，以搜索改变生活，推动人类的文明与进步，促进中国经济的发展为己任，正朝着更为远大的目标而迈进。"
                                                  ]
                                                 ];
//    [publishString addAttribute: NSForegroundColorAttributeName value: [UIColor blueColor] range: NSMakeRange(0,10)];
    [publishString addAttribute: NSLinkAttributeName value: @"http://www.google.com" range: NSMakeRange(0, 10)];
    label.attributedText = publishString;
    [self.view addSubview:label];
    [self getAutoHeightByLabel:label];
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


- (CGSize) getAutoHeightByLabel:(UILabel*)label
{
    CGSize size =  [label.text sizeWithFont:label.font constrainedToSize:CGSizeMake(label.frame.size.width, 2000) lineBreakMode:NSLineBreakByTruncatingTail];
    if ([label.text isEqualToString:@""]) { //为空的情况，有时候有高度
        size = CGSizeMake(label.frame.size.width, 0);
    }
    label.frame = CGRectMake(label.frame.origin.x, label.frame.origin.y, label.frame.size.width, size.height);
    return size;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

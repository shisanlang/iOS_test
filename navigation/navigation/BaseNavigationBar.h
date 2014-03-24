//
//  BaseNavigationBar.h
//  pincheke
//
//  Created by duan on 13-7-30.
//  Copyright (c) 2013年 duan. All rights reserved.
//

#ifndef pincheke_BaseNavigationBar_h
#define pincheke_BaseNavigationBar_h



#endif


@interface MyNavigationBar : UINavigationBar
@end
@implementation MyNavigationBar
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
}
@end
@implementation UINavigationBar (LazyNavigationBar)
+ (Class)class {  return NSClassFromString(@"MyNavigationBar");}
-(void)drawRect:(CGRect)rect
{
    UIImage *backImage = [UIImage imageNamed:@"top_bg.png"];
    [backImage drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
}

@end
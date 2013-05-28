//
//  UIRadioButton.m
//  UIRadio
//
//  Created by duan on 13-5-27.
//  Copyright (c) 2013年 duan. All rights reserved.
//

#import "UIRadioButton.h"

@implementation UIRadioButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self = [UIButton buttonWithType:UIButtonTypeCustom];
        self.frame = CGRectMake(frame.origin.x, frame.origin.y, 20, 20);//19 19
        [self setImage:[UIImage imageNamed:@"image_check.png"] forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:@"image_checked.png"] forState:UIControlStateSelected];
        [self addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}

- (void)click:(id)sender
{
    self.selected = !self.selected;
}
//- (void)setSelected:(BOOL)selected
//{
//    self.selected = !selected;
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

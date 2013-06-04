//
//  DxdsButton.m
//  Block
//
//  Created by duan on 13-5-30.
//  Copyright (c) 2013年 duan. All rights reserved.
//

#import "DxdsButton.h"

@implementation DxdsButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


-(void) handleControlEvent:(UIControlEvents)event
                 withBlock:(ActionBlock) action
{
    NSLog(@"------------%@",action);
    _actionBlock = Block_copy(action);
   
    [self addTarget:self action:@selector(callActionBlock:) forControlEvents:event];
}

-(void) callActionBlock:(id)sender{
    _actionBlock();
}

-(void) dealloc{
    Block_release(_actionBlock);
    [super dealloc];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

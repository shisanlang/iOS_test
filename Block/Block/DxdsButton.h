//
//  DxdsButton.h
//  Block
//
//  Created by duan on 13-5-30.
//  Copyright (c) 2013年 duan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ActionBlock)();

@interface DxdsButton : UIButton
{
    ActionBlock _actionBlock;
}

-(void) handleControlEvent:(UIControlEvents)event
                 withBlock:(ActionBlock) action;


@end

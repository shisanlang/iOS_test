//
//  BlockView.h
//  pudding
//
//  Created by dxd on 15/3/23.
//  Copyright (c) 2015年 dxd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BlockView : UIView
{
    float from;
    float to;
}
@property (strong, nonatomic) CADisplayLink *displayLink;
@property (assign, nonatomic) float from;
@property (assign, nonatomic) float to;

- (void)startAnimationFrom:(float)from to:(float)to;
- (void)completeAnimation;

@end

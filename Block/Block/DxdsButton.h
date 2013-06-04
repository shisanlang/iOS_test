//
//  DxdsButton.h
//  Block
//
//  Created by duan on 13-5-30.
//  Copyright (c) 2013年 duan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

typedef void (^ActionBlock)();

@interface UIButton(Block)// : UIButton


@property (readonly) NSMutableDictionary *event;

- (void) handleControlEvent:(UIControlEvents)controlEvent withBlock:(ActionBlock)action;

@end

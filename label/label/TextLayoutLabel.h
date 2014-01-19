//
//  TextLayoutLabel.h
//  label
//
//  Created by duan on 14-1-18.
//  Copyright (c) 2014年 duan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextLayoutLabel : UILabel
{
@private

CGFloat characterSpacing_;         //字间距

@private

long linesSpacing_;                //行间距

}

@property (nonatomic, assign) CGFloat characterSpacing;

@property (nonatomic, assign) long linesSpacing;

@end

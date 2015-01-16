//
//  ViewController.h
//  AutoLayout
//
//  Created by dxd on 14-11-6.
//  Copyright (c) 2014年 dxd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    IBOutlet UILabel * autolayoutLabel;
    IBOutlet NSLayoutConstraint * labelLeftConstraint;
    IBOutlet NSLayoutConstraint * labelWidthConstraint;
}

@end


//
//  buttonViewController.h
//  button
//
//  Created by shisan lang on 11-8-4.
//  Copyright 2011年 BeiJingChaoYangQu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface buttonViewController : UIViewController {
    IBOutlet UIPickerView * picker;
}

@property(nonatomic,retain) UIPickerView * picker;
@end

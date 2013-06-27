//
//  ViewController.h
//  textfield
//
//  Created by duan on 13-6-27.
//  Copyright (c) 2013年 duan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>
{
    UITextField *password;
}

@property(nonatomic,retain) UITextField *password;
@end

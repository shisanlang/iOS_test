//
//  ViewController.h
//  uicolor
//
//  Created by 彦斌 刘 on 12-5-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (retain, nonatomic) IBOutlet UITextField *text;
- (IBAction)but:(id)sender;
@property (retain, nonatomic) IBOutlet UIButton *but;
@property (retain, nonatomic) IBOutlet UILabel *label;
- (UIColor *) colorWithHexString: (NSString *) stringToConvert;

@end

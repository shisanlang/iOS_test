//
//  ViewController.h
//  KVO
//
//  Created by dxd on 14-3-13.
//  Copyright (c) 2014年 dxd. All rights reserved.
//

#import <UIKit/UIKit.h>
@class StockData;

@interface ViewController : UIViewController
{
    StockData *stockForKVO;
    UILabel *myLabel;
}


@end

//
//  ViewController.h
//  PageViewCtrl
//
//  Created by duan on 13-6-19.
//  Copyright (c) 2013年 duan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIScrollViewDelegate>
{
    UIScrollView *imageScroll;
    UIPageControl *pageControl;
    UILabel * imageNum;
    UIImageView *Image1;
    UIImageView *Image2;
    UIImageView *Image3;
    UIImageView *Image4;
    UIImageView *Image5;
    UIButton *ImageButton1;
    UIButton *ImageButton2;
    UIButton *ImageButton3;
    UIButton *ImageButton4;
    UIButton *ImageButton5;
}

@property(nonatomic,retain) UIScrollView *imageScroll;
@property(nonatomic,retain) UIPageControl *pageControl;
@property(nonatomic,retain) UILabel * imageNum;
@property(nonatomic,retain) UIImageView *Image1;
@property(nonatomic,retain) UIImageView *Image2;
@property(nonatomic,retain) UIImageView *Image3;
@property(nonatomic,retain) UIImageView *Image4;
@property(nonatomic,retain) UIImageView *Image5;
@property(nonatomic,retain) UIButton *ImageButton1;
@property(nonatomic,retain) UIButton *ImageButton2;
@property(nonatomic,retain) UIButton *ImageButton3;
@property(nonatomic,retain) UIButton *ImageButton4;
@property(nonatomic,retain) UIButton *ImageButton5;

@end

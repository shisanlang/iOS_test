//
//  UIImageViewTap.h
//  iCitySuzhou2.0
//
//  Created by Chen Nan on 6/21/11.
//  Copyright 2011 Yulong. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol UIImageViewTapDelegate;

@interface UIImageViewTap : UIImageView {
	id <UIImageViewTapDelegate> tapDelegate;
}
@property (nonatomic, assign) id <UIImageViewTapDelegate> tapDelegate;
- (void)handleSingleTap:(UITouch *)touch;
- (void)handleDoubleTap:(UITouch *)touch;
- (void)handleTripleTap:(UITouch *)touch;
@end

@protocol UIImageViewTapDelegate <NSObject>
@optional
- (void)imageView:(UIImageView *)imageView singleTapDetected:(UITouch *)touch;
- (void)imageView:(UIImageView *)imageView doubleTapDetected:(UITouch *)touch;
- (void)imageView:(UIImageView *)imageView tripleTapDetected:(UITouch *)touch;
@end
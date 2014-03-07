//
//  UIViewTap.h
//  iCitySuzhou2.0
//
//  Created by Chen Nan on 6/21/11.
//  Copyright 2011 Yulong. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol UIViewTapDelegate;

@interface UIViewTap : UIView {
	id <UIViewTapDelegate> tapDelegate;
}
@property (nonatomic, assign) id <UIViewTapDelegate> tapDelegate;
- (void)handleSingleTap:(UITouch *)touch;
- (void)handleDoubleTap:(UITouch *)touch;
- (void)handleTripleTap:(UITouch *)touch;
@end

@protocol UIViewTapDelegate <NSObject>
@optional
- (void)view:(UIView *)view singleTapDetected:(UITouch *)touch;
- (void)view:(UIView *)view doubleTapDetected:(UITouch *)touch;
- (void)view:(UIView *)view tripleTapDetected:(UITouch *)touch;
@end

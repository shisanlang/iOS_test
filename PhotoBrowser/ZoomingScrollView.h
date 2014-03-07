//
//  ZoomingScrollView.h
//  iCitySuzhou2.0
//
//  Created by Chen Nan on 6/21/11.
//  Copyright 2011 Yulong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIImageViewTap.h"
#import "UIViewTap.h"

@class PhotoBrowser;

@interface ZoomingScrollView : UIScrollView <UIScrollViewDelegate, UIImageViewTapDelegate, UIViewTapDelegate> {
	
	// Browser
	PhotoBrowser *photoBrowser;
	
	// State
	NSUInteger index;
	
	// Views
	UIViewTap *tapView; // for background taps
	UIImageViewTap *photoImageView;
	UIActivityIndicatorView *spinner;
	
}

// Properties
@property (nonatomic) NSUInteger index;
@property (nonatomic, assign) PhotoBrowser *photoBrowser;

// Methods
- (void)displayImage;
- (void)displayImageFailure;
- (void)setMaxMinZoomScalesForCurrentBounds;
- (void)handleSingleTap:(CGPoint)touchPoint;
- (void)handleDoubleTap:(CGPoint)touchPoint;

@end
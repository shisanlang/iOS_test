//
//  EGORefreshTableBottomView.h
//  Simple Table
//
//  Created by  phoenixnet on 11-1-6.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "EGORefresh.h"

@protocol EGORefreshTableBottomDelegate;
@interface EGORefreshTableBottomView : UIView {
	
	id _delegate;
	EGOPullRefreshState _state;
	
	UILabel *_lastUpdatedLabel;
	UILabel *_statusLabel;
	CALayer *_arrowImage;
	UIActivityIndicatorView *_activityView;
}

@property(nonatomic,assign) id <EGORefreshTableBottomDelegate> delegate;

- (void)refreshPageInfo;
- (void)egoRefreshScrollViewDidScroll:(UIScrollView *)scrollView ;
- (void)egoRefreshScrollViewDidEndDragging:(UIScrollView *)scrollView ;
- (void)egoRefreshScrollViewDataSourceDidFinishedLoading:(UIScrollView *)scrollView;
- (void)egoChangeBottomItemFrame:(UIScrollView *)scrollView;
@end
@protocol EGORefreshTableBottomDelegate
- (void)egoRefreshTableBottomDidTriggerRefresh:(EGORefreshTableBottomView*)view;
- (BOOL)egoRefreshTableBottomDataSourceIsLoading:(EGORefreshTableBottomView*)view;
- (NSInteger)egoRefreshTableBottomCurrentPage:(EGORefreshTableBottomView*)view;
- (NSInteger)egoRefreshTableBottomTotalPage:(EGORefreshTableBottomView*)view;
@optional
- (NSDate*)egoRefreshTableBottomDataSourceLastUpdated:(EGORefreshTableBottomView*)view;
@end

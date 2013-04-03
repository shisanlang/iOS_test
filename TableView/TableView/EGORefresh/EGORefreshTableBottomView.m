//
//  EGORefreshTableBottomView.m
//  Simple Table
//
//  Created by  phoenixnet on 11-1-6.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EGORefreshTableBottomView.h"


#define TEXT_COLOR	 [UIColor colorWithRed:87.0/255.0 green:108.0/255.0 blue:137.0/255.0 alpha:1.0]
#define FLIP_ANIMATION_DURATION 0.18f


@interface EGORefreshTableBottomView (Private)
- (void)setState:(EGOPullRefreshState)aState;
@end

@implementation EGORefreshTableBottomView

@synthesize delegate=_delegate;


- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
		
		self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
		self.backgroundColor = [UIColor colorWithRed:226.0/255.0 green:231.0/255.0 blue:237.0/255.0 alpha:1.0];
		
		UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 35.0f, self.frame.size.width, 20.0f)];
		label.autoresizingMask = UIViewAutoresizingFlexibleWidth;
		label.font = [UIFont systemFontOfSize:12.0f];
		label.textColor = TEXT_COLOR;
		label.shadowColor = [UIColor colorWithWhite:0.9f alpha:1.0f];
		label.shadowOffset = CGSizeMake(0.0f, 1.0f);
		label.backgroundColor = [UIColor clearColor];
		label.textAlignment = UITextAlignmentCenter;
		[self addSubview:label];
		_lastUpdatedLabel=label;
		[label release];
		
		label = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 13.0f, self.frame.size.width, 20.0f)];
		label.autoresizingMask = UIViewAutoresizingFlexibleWidth;
		label.font = [UIFont boldSystemFontOfSize:13.0f];
		label.textColor = TEXT_COLOR;
		label.shadowColor = [UIColor colorWithWhite:0.9f alpha:1.0f];
		label.shadowOffset = CGSizeMake(0.0f, 1.0f);
		label.backgroundColor = [UIColor clearColor];
		label.textAlignment = UITextAlignmentCenter;
		[self addSubview:label];
		_statusLabel=label;
		[label release];
		
		CALayer *layer = [CALayer layer];
		layer.frame = CGRectMake(25.0f, 0.0f, 30.0f, 55.0f);
		layer.contentsGravity = kCAGravityResizeAspect;
		layer.contents = (id)[UIImage imageNamed:@"blueArrowUp.png"].CGImage;
		
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 40000
		if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
			layer.contentsScale = [[UIScreen mainScreen] scale];
		}
#endif
		
		[[self layer] addSublayer:layer];
		_arrowImage=layer;
		
		UIActivityIndicatorView *view = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
		view.frame = CGRectMake(25.0f, 22.0f, 20.0f, 20.0f);
		[self addSubview:view];
		_activityView = view;
		[view release];
		
		
		[self setState:EGOOPullRefreshNormal];
		
    }
	
    return self;
	
}


#pragma mark -
#pragma mark Setters

- (void)refreshPageInfo {
	
	if ([_delegate respondsToSelector:@selector(egoRefreshTableBottomCurrentPage:)]
		&& [_delegate respondsToSelector:@selector(egoRefreshTableBottomTotalPage:)]) {
		NSInteger curPage = [_delegate egoRefreshTableBottomCurrentPage:self];
		NSInteger totalPage = [_delegate egoRefreshTableBottomTotalPage:self];
		
		if (curPage == totalPage) {
			_lastUpdatedLabel.text = [NSString stringWithFormat:@"当前页数：%d/%d", curPage, totalPage];
		}else {
			_lastUpdatedLabel.text = [NSString stringWithFormat:@"当前页数：%d/%d", curPage, totalPage];
		}		
	} else {
		
		_lastUpdatedLabel.text = nil;
	}
}

- (void)setState:(EGOPullRefreshState)aState{
	
	switch (aState) {
		case EGOOPullRefreshPulling:
			_statusLabel.text = NSLocalizedString(@"松手获取下一页...", @"Release to refresh status");
			[CATransaction begin];
			[CATransaction setAnimationDuration:FLIP_ANIMATION_DURATION];
			_arrowImage.transform = CATransform3DMakeRotation((M_PI / 180.0) * 180.0f, 0.0f, 0.0f, 1.0f);
			[CATransaction commit];
			
			break;
		case EGOOPullRefreshNormal:
			
			if (_state == EGOOPullRefreshPulling) {
				[CATransaction begin];
				[CATransaction setAnimationDuration:FLIP_ANIMATION_DURATION];
				_arrowImage.transform = CATransform3DIdentity;
				[CATransaction commit];
			}
			
			_statusLabel.text = NSLocalizedString(@"上拉即可获取下一页...", @"Pull down to refresh status");
			[_activityView stopAnimating];
			[CATransaction begin];
			[CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions]; 
			_arrowImage.hidden = NO;
			_arrowImage.transform = CATransform3DIdentity;
			[CATransaction commit];
			
			[self refreshPageInfo];
			
			break;
		case EGOOPullRefreshLoading:
			
			_statusLabel.text = NSLocalizedString(@"正在加载...", @"Loading Status");
			[_activityView startAnimating];
			[CATransaction begin];
			[CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions]; 
			_arrowImage.hidden = YES;
			[CATransaction commit];
			
			break;
		default:
			break;
	}
	
	_state = aState;
}


- (void)egoChangeBottomItemFrame:(UIScrollView *)scrollView{
	if (self.frame.origin.y != scrollView.contentSize.height) {
	 CGRect rect = self.frame;
	 rect.origin = CGPointMake(0, scrollView.contentSize.height);
	 self.frame = rect;
	 }	
}

#pragma mark -
#pragma mark ScrollView Methods

- (void)egoRefreshScrollViewDidScroll:(UIScrollView *)scrollView {	
	
	NSInteger totalHeight = scrollView.contentSize.height;
	NSInteger listHeight = scrollView.frame.size.height;
	if (totalHeight == 0) {
		return ;
	}

	if (_state == EGOOPullRefreshLoading) {
		//scrollView.contentOffset.y * -1
/*		CGFloat offset = MAX(scrollView.contentOffset.y+listHeight-totalHeight, 0);
		offset = MIN(offset, 60);
		scrollView.contentInset = UIEdgeInsetsMake(0.0f, 0.0f, offset, 0.0f);*/
		
	} else if (scrollView.isDragging) {
		BOOL _loading = NO;
		if ([_delegate respondsToSelector:@selector(egoRefreshTableBottomDataSourceIsLoading:)]) {
			_loading = [_delegate egoRefreshTableBottomDataSourceIsLoading:self];
		}
		
		float offset = totalHeight-scrollView.contentOffset.y-listHeight;
		if (_state == EGOOPullRefreshPulling && offset > -65.0f && offset < 0.0f && !_loading) {
			[self setState:EGOOPullRefreshNormal];
		} else if (_state == EGOOPullRefreshNormal && offset < -65.0f && !_loading) {
			[self setState:EGOOPullRefreshPulling];
		}
		
		if (scrollView.contentInset.top != 0) {
			scrollView.contentInset = UIEdgeInsetsZero;
		}
		
	}
}

- (void)egoRefreshScrollViewDidEndDragging:(UIScrollView *)scrollView {
	
	NSInteger totalHeight = scrollView.contentSize.height;
	NSInteger listHeight = scrollView.frame.size.height;
	if (totalHeight == 0) {
		return ;
	}
	
	NSInteger curPage = [_delegate egoRefreshTableBottomCurrentPage:self];
	NSInteger totalPage = [_delegate egoRefreshTableBottomTotalPage:self];
	
	if (curPage == totalPage)
	{
		return ;
	}
	
	BOOL _loading = NO;
	if ([_delegate respondsToSelector:@selector(egoRefreshTableBottomDataSourceIsLoading:)]) {
		_loading = [_delegate egoRefreshTableBottomDataSourceIsLoading:self];
	}
	
	
	float offset = totalHeight - scrollView.contentOffset.y - listHeight;
	if (offset <= - 65.0f && !_loading) {
		
		if ([_delegate respondsToSelector:@selector(egoRefreshTableBottomDidTriggerRefresh:)]) {
			[_delegate egoRefreshTableBottomDidTriggerRefresh:self];
		}
		
		[self setState:EGOOPullRefreshLoading];
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationDuration:0.2];
		CGFloat top = scrollView.contentInset.top;
		scrollView.contentInset = UIEdgeInsetsMake(top, 0.0f, 60.0f, 0.0f);
		[UIView commitAnimations];
	}
}

- (void)egoRefreshScrollViewDataSourceDidFinishedLoading:(UIScrollView *)scrollView {	
	
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:.3];
	CGFloat top = scrollView.contentInset.top ;
	[scrollView setContentInset:UIEdgeInsetsMake(top, 0.0f, 0.0f, 0.0f)];
	[UIView commitAnimations];
	
	[self setState:EGOOPullRefreshNormal];
	
}


#pragma mark -
#pragma mark Dealloc

- (void)dealloc {
	
	_delegate=nil;
	_activityView = nil;
	_statusLabel = nil;
	_arrowImage = nil;
	_lastUpdatedLabel = nil;
    [super dealloc];
}


@end


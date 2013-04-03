//
//  ViewController.h
//  TableView
//
//  Created by duan on 13-3-22.
//  Copyright (c) 2013年 duan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "common.h"
#import "EGORefreshTableHeaderView.h"

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource,EGORefreshTableHeaderDelegate>
{
    UITableView *ListTableView;
    NSMutableArray *SubItemList;//数据列表数组
    //
    EGORefreshTableHeaderView *_refreshHeaderView;
    BOOL _reloading;
    
    int pageNO;//请求页面数
//	int UIHeight;//屏幕总高
    BOOL bReloadMore;
    UILabel *LoadMoreLabel;
}

@property (nonatomic, retain) UITableView *ListTableView;
@property (nonatomic, retain) NSMutableArray *SubItemList;//数据列表数组
@property (nonatomic, retain) EGORefreshTableHeaderView *_refreshHeaderView;

-(void)reloadTableViewDataSource;
-(void)doneLoadingTableViewData;
-(void)requestMoreOnline;
-(void)stoprequestMore;

@end

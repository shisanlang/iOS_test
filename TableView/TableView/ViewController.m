//
//  ViewController.m
//  TableView
//
//  Created by duan on 13-3-22.
//  Copyright (c) 2013年 duan. All rights reserved.
//

#import "ViewController.h"
#import "CarServiceCell.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize SubItemList;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //数据
    bReloadMore=YES;
    self.SubItemList=[[NSMutableArray alloc]initWithObjects: @"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",nil];
    ListTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, XD_SCREENHEIGHT) style:UITableViewStylePlain];
	ListTableView.dataSource = self;
	ListTableView.delegate = self;
    ListTableView.separatorColor=[UIColor clearColor];
//    ListTableView.backgroundColor=[UIColor clearColor];
//    ListTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
	[self.view addSubview:ListTableView];
    
    if (_refreshHeaderView == nil) {
        
        EGORefreshTableHeaderView *view = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0.0f, 0.0f - ListTableView.bounds.size.height, ListTableView.frame.size.width, ListTableView.bounds.size.height)];
        view.delegate = self;
        [ListTableView addSubview:view];
        _refreshHeaderView = view;
        [view release];
    }
    [_refreshHeaderView refreshLastUpdatedDate];
    
    
    //编辑 评论
    UIButton *CommentEditButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    CommentEditButton.frame = CGRectMake(0.0f, 0.0f, 60.0f, 30.0f);
    //    [RefreshButton addSubview:backButtonImageView];
    //    [backButtonImageView release];
    [CommentEditButton setTitle:@"编辑" forState:UIControlStateNormal];
    [CommentEditButton addTarget:self action:@selector(commentEditTouchUp) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:CommentEditButton] autorelease];
}

//
- (void)commentEditTouchUp
{
    [ListTableView setEditing:!ListTableView.editing animated:YES];
}


//table
#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.SubItemList count]>0?[self.SubItemList count]+1:0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
	// Configure the cell.
    
    if (indexPath.row==[SubItemList count]) {
        static NSString *CellIdentifier = @"DataCellLast";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        }
        
        
        LoadMoreLabel=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 54)];
        LoadMoreLabel.text=@"点击加载更多...";
        LoadMoreLabel.font=[UIFont boldSystemFontOfSize:14];
        LoadMoreLabel.textColor=[UIColor colorWithRed:128.0/255 green:128.0/255 blue:128.0/255 alpha:1.0];
        LoadMoreLabel.textAlignment=UITextAlignmentCenter;
        LoadMoreLabel.backgroundColor=[UIColor clearColor];
        [cell addSubview:LoadMoreLabel];
        [LoadMoreLabel release];
        
        return cell;
    } else {
        
        static NSString *CellIdentifier = @"DataCell";
        
        CarServiceCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[[CarServiceCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        }
        
//        cell.textLabel.text = [self.SubItemList objectAtIndex:indexPath.row];
        return cell;
    }
    
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 85;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==[SubItemList count]) {
        [self requestMoreOnline];
    }
}

//ego
#pragma mark -
#pragma mark Data Source Loading / Reloading Methods

- (void)reloadTableViewDataSource{
	
	//  should be calling your tableviews data source model to reload
	//  put here just for demo
	_reloading = YES;
    [self.SubItemList addObject:@"a"];
    [ListTableView reloadData];
}

- (void)doneLoadingTableViewData{
	
	//  model should call this when its done loading
	_reloading = NO;
	[_refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:ListTableView];
	
}


#pragma mark -
#pragma mark UIScrollViewDelegate Methods

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
	
	[_refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
	
//    NSLog(@"%f\t%f\t%f = %f",scrollView.contentOffset.y,scrollView.contentSize.height,XD_SCREENHEIGHT,scrollView.contentSize.height-XD_SCREENHEIGHT-50);
    
    //刷新
    if (scrollView.contentOffset.y<-50 && !_reloading) {
        [_refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
    }
    //更多
    else if ((
             (scrollView.contentOffset.y >= 50 && (scrollView.contentSize.height < scrollView.frame.size.height)
             ) ||
             (scrollView.contentOffset.y > scrollView.contentSize.height-XD_SCREENHEIGHT+50 && scrollView.contentSize.height > scrollView.frame.size.height
            ))&& !_reloading
            )
    {
            
        _reloading = YES;
    
        [self requestMoreOnline];
    
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.2];
        [ListTableView setContentInset:UIEdgeInsetsMake(0.0f, 0.0f, 0.0f, 0.0f)];
        [UIView commitAnimations];
        
    } else {
        //可以删除,ego不需要刷新不刷新
//        [_refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
    }
	
}

//

- (void)dataSourceDidFinishLoadingNewData{
	
	_reloading = NO;
	
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:3];
	[ListTableView setContentInset:UIEdgeInsetsMake(0.0f, 0.0f, 0.0f, 0.0f)];
	[UIView commitAnimations];
	
	
	
}

-(void)requestMoreOnline
{
    if (bReloadMore==YES) {
        bReloadMore=NO;
        LoadMoreLabel.hidden=YES;
        
        [self performSelector:@selector(stoprequestMore) withObject:nil afterDelay:1.0];
        
        //[progressInd stopAnimating];
        //LoadMoreLabel.hidden=NO;
        //[ListTableView reloadData];
        
        bReloadMore = YES;
        
        
        [self.SubItemList addObject:[NSString stringWithFormat:@"%d",[self.SubItemList count]+1]];
        [self.ListTableView reloadData];
//        MsgPage++;
//        [self GetCouponListData];
        [self dataSourceDidFinishLoadingNewData];
    }
}

-(void)stoprequestMore{
//    [progressInd stopAnimating];
    LoadMoreLabel.hidden=NO;
    //    SubItemList=[NSMutableArray arrayWithObjects:@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"", nil];
    //    [SubItemList retain];
    [ListTableView reloadData];
}


#pragma mark -
#pragma mark EGORefreshTableHeaderDelegate Methods

//下拉
- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView*)view{
	
	
	[self reloadTableViewDataSource];
	[self performSelector:@selector(doneLoadingTableViewData) withObject:nil afterDelay:1];
	
}

- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view{
	
	return _reloading; // should return if data source model is reloading
	
}

- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView*)view{
	
	return [NSDate date]; // should return date data source was last changed
	
}

///
//评论表格编辑
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        return NO;
    }
    return YES;
    
}

//设置编辑样式(默认为删除，也可以设插入操作等)

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return UITableViewCellEditingStyleDelete;
    
}

//编辑模式处理

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //这里进行插入，删除，编辑操作
    [SubItemList removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

//移动
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

//移动时数组的操作
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
//    NSUInteger fromRow = [fromIndexPath row];
//    NSUInteger toRow = [toIndexPath row];
//    
//    id object = [[list objectAtIndex:fromRow] retain];
//    [list removeObjectAtIndex:fromRow];
//    [list insertObject:object atIndex:toRow];
//    [object release];
}
//////

- (void)dealloc {
	
	_refreshHeaderView = nil;
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

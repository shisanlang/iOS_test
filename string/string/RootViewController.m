//
//  RootViewController.m
//  string
//
//  Created by shisan lang on 11-7-25.
//  Copyright 2011年 BeiJingChaoYangQu. All rights reserved.
//

#import "RootViewController.h"

@implementation RootViewController

@synthesize strR;

- (void)viewDidLoad
{
//    NSString * str;
//    NSLog(@"str = %u",[str hash]);
//    NSLog(@"str = %@,%@",str==nil ? @"true" : @"false",str);
//    if (str) {NSLog(@"str = ture");} else {NSLog(@"str = false");}
//    NSLog(@"str = %@",str ? @"true" : @"false");
//    str = @"";
//    NSLog(@"str = %@",str ? @"true" : @"false");
//    str = @"str";
//    NSLog(@"str = %@",str ? @"true" : @"false");
//    int num = 0;
//    NSLog(@"num = %d",num ? 1 : 0);
    
//    NSArray * ReviceDataArray = [ReviceData componentsSeparatedByString:@";"];

//    NSArray * DataArray = [[ReviceDataArray objectAtIndex:i] componentsSeparatedByString:@","];

//    if ([valstyle isEqual:@"float"]) {

//    baseurl = @"http://info.wiapi.hexun.com/mobile/%@/run_news_list.xhtml";
//    baseurl = [NSString stringWithFormat:baseurl, @"jiepan"];
    
//    NSMutableString * str1 = [[NSMutableString alloc] init];
//    [str1 setString:@"1"];
//    NSString * str2 = @"2";
//    [str1 appendString:str2];
//    NSLog(@"%@",str1);
//    [str1 release];
    
//    NSString * charA = @"aBC123";
//    NSLog(@"%@",[charA uppercaseString]);

//    NSLog(@"nil=%d,%f,%@",nil,nil,nil);
    
//    NSLog(@"timeString = \"%@\"",[@" abc  " stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]);
//    
////    ReturnDataBody = [ReturnData subdataWithRange:NSMakeRange(4, ReviceDataLen)];
//    //分隔字符串
    NSLog(@"////////////////分隔字符串////////////////////");
    NSString * imgs = @"1|23|4|";
    NSArray * imgArray = [imgs componentsSeparatedByString:@"|"];
    for (int i=0; i<[imgArray count]; i++) {
        NSLog(@"%i = %@",i,[imgArray objectAtIndex:i]);
    }
//    //判断数据类型
//    NSString * strData= [[NSString alloc] init];
//    NSLog(@"数据类型:%d", [strData isKindOfClass:[NSString class]] );
    
	//从   至
//	NSString * url = [[NSString alloc]initWithString:@"http://vdata.tool.hexun.com/2012-01-11/137157623.mp4"];
//	NSLog(@"url=%d,%@,%@",[url length],[url substringToIndex:[url length]-4],[url substringFromIndex:[url length]-4]);
	
	//内存泄漏
//	NSMutableString * str = [[NSMutableString alloc]initWithString:@"leak"];
//	NSString * strtmp = [[NSString alloc]initWithFormat:@"abc"];
//	NSLog(@"strtmp count = %d",[strtmp retainCount]);
//	strR = strtmp;
//	NSLog(@"strR,strtmp count = %d,%d",[strR retainCount],[strtmp retainCount]);
//	[strtmp release];
//	NSLog(@"strR,strtmp count = %d,%d",[strR retainCount],[strtmp retainCount]);
//	strR = [[NSString alloc]initWithFormat:@"abc"];
//	[strR retain];
//	[strR retain];
//	strR = nil;
	strR = [NSString stringWithFormat:@"/bstock/select"];
	NSLog(@"strR count = %d,%d",[strR retainCount],[self.strR retainCount]);
	
	//数值转换
//	NSString * num1 = @"-1";
//	NSString * num2 = @"aaa";
//	NSString * num3 = @"-3aaa";
//	NSString * num4 = @"44aaa";
//	NSString * num5 = @"aaa55bbb";
//	NSString * num6 = @"666aaa";
//	NSString * num7 = @"aaa77";
//	NSLog(@"num1 = %@,\nnum1 = %d,\nnum2 = %d,\nnum3 = %d,\nnum4 = %d,\nnum5 = %d,\nnum6 = %d,\nnum7 = %d",
//		  num1,[num1 intValue],[num2 intValue],[num3 intValue],[num4 intValue],[num5 intValue],[num6 intValue],[num7 intValue]);
	
    
    //urlencode
	NSString *urlstr = @"http://www.baidu.com/你好";
    NSStringEncoding gb2312Encode = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    NSString *urlstr2 = [urlstr stringByReplacingPercentEscapesUsingEncoding:gb2312Encode];
    NSLog(urlstr);
    NSLog(@"输出UTF8编码 = %@",[urlstr2 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]);
    NSLog(@"输出GB2312编码 = %@",[urlstr2 stringByAddingPercentEscapesUsingEncoding:gb2312Encode]);
    
    
    //!= ==
    NSString * strCmp1 = nil;
    NSString * strCmp2 = [[NSString alloc]init];
    NSLog(@"strCmp = %d,%d",strCmp1 == @"",strCmp2 == @"");
    
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

/*
 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 */

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }

    // Configure the cell.
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert)
    {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
    // ...
    // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
    [detailViewController release];
	*/
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload
{
    [super viewDidUnload];

    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}

- (void)dealloc
{
    [super dealloc];
}

@end

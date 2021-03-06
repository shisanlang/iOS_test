//
//  RootViewController.m
//  appstore
//
//  Created by shisan lang on 11-7-27.
//  Copyright 2011年 BeiJingChaoYangQu. All rights reserved.
//

#import "RootViewController.h"

@implementation RootViewController

- (void)viewDidLoad
{
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
    return 10;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"AppStore 下载(app内打开)";
            break;
        case 1:
            cell.textLabel.text = @"AppStore 下载1";
            break;
        case 2:
            cell.textLabel.text = @"AppStore 下载2";
            break;
        case 3:
            cell.textLabel.text = @"评论1";
            break;
        case 4:
            cell.textLabel.text = @"评论2";
            break;
        case 5:
            cell.textLabel.text = @"PassBook";
            break;
        case 6:
            cell.textLabel.text = @"微信";
            break;
        case 7:
            cell.textLabel.text = @"";
            break;
            
        default:
            break;
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
    
    // app store
    if (indexPath.row == 0) {
        
        /**/
        SKStoreProductViewController *skVC=[SKStoreProductViewController new];
        skVC.delegate=self;
        NSDictionary *dict = [NSDictionary dictionaryWithObject:@"573140028" forKey:SKStoreProductParameterITunesItemIdentifier];
        [skVC loadProductWithParameters:dict completionBlock:nil];
        [self presentViewController:skVC animated:YES completion:nil];//放入completionBlock里，右上角就没有商店 按钮
        /**/
        //@"395133418"  可在itunes的连接中找到
        
        
        //方法2
//        NSString * appID = @"835609516";
//        
//        Class isAllow = NSClassFromString(@"SKStoreProductViewController");
//        if (isAllow != nil) {
//            SKStoreProductViewController *sKStoreProductViewController = [[SKStoreProductViewController alloc] init];
//            //            [sKStoreProductViewController.view setFrame:CGRectMake(0, 200, 320, 200)];
//            [sKStoreProductViewController setDelegate:self];
//            [sKStoreProductViewController loadProductWithParameters:@{SKStoreProductParameterITunesItemIdentifier: appID}
//                                                    completionBlock:^(BOOL result, NSError *error) {
//                                                        if (result) {
//                                                            [self presentViewController:sKStoreProductViewController animated:YES completion:nil];
//                                                        }else{
//                                                            NSLog(@"error:%@",error);
//                                                        }
//                                                    }];
//        }
        
    } else if (indexPath.row == 1) {
        
        NSString *iTunesLink = @"http://phobos.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=425583856&mt=8";
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:iTunesLink]];
        
    } else if (indexPath.row == 2) {
        
        NSString *iTunesLink = @"http://itunes.apple.com/cn/app/id425583856?mt=8";
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:iTunesLink]];
    
    //2 打开评论
    } else if (indexPath.row == 3) {
        
//        @"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=1102296510"
        NSString * urlString = @"http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=1102296510&pageNumber=0&sortOrdering=2&type=Purple+Software&mt=8";
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
        
    } else if (indexPath.row == 4) {
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"itms-apps://phobos.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=1102296510"]];
        
    //passbook
    } else if (indexPath.row == 5) {
        
//        NSURL * passbookUrl = [NSURL URLWithString:@"http://iyoapp.com/test/api/ios/passbook/example.php"];
//        NSData *data = [NSData dataWithContentsOfURL:(NSURL *)passbookUrl];
        /**/
         NSData *data=[[NSData alloc]initWithContentsOfFile:[self passPath]];
         NSError *err;
         PKPass *pass=[[PKPass alloc]initWithData:data error:&err];
         if (!err) {
         PKAddPassesViewController *vc=[[PKAddPassesViewController alloc]initWithPass:pass];
         [vc setDelegate:self];
         [self presentViewController:vc animated:YES completion:nil];
         }
         /**/
        
    //weixin
    } else if (indexPath.row == 6) {
        
        //http://weixin.qq.com/r/ZXV7dFbE92iIh0cXnyBB       robot_9
        NSString *str = [NSString stringWithFormat:@"weixin://qr/%@",@"ZXV7dFbE92iIh0cXnyBB"];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
    }
    
}

//app store
//此方法是SKStoreProductViewControllerDelegate的实现方法，用于监控返回的按钮状态
-(void) productViewControllerDidFinish:(SKStoreProductViewController *)viewController{
    
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"dismiss");
    }];
}

//passbook
-(NSString *) passPath
{
    return [[NSBundle mainBundle] pathForResource:@"MyPass" ofType:@"pkpass"];
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

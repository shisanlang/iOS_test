//
//  ViewController.m
//  gcd
//
//  Created by dxd on 14-4-29.
//  Copyright (c) 2014年 dxd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    //1
    //在GCD上异步执行非UI相关任务
    dispatch_queue_t concurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(concurrentQueue, ^{
        __block UIImage *image = nil;
        dispatch_sync(concurrentQueue, ^{
            /*download the image here*/
            NSString *urlString = @"http://cms.csdnimg.cn/article/201310/09/5254b7b6c74cb.jpg";
            NSURL *url = [NSURL URLWithString:urlString];
            NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
            NSError *downloadError = nil;
            NSData *imageData = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:nil error:&downloadError];
            if (downloadError == nil && imageData != nil) {
                image = [UIImage imageWithData:imageData];
            }
            else if(downloadError != nil){
                NSLog(@"Error happened = %@",downloadError);
            }
            else{
                NSLog(@"No data could get download from the URL");
            }
        });
        dispatch_sync(dispatch_get_main_queue(), ^{
            /*show the image to the user here on the main queue*/
            if(image != nil){
                //create the image view here
                UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
                [imageView setImage:image];
                /* make sure the image is not scaled incorrectly */
                [imageView setContentMode:UIViewContentModeScaleAspectFit];
                /* add the image to this view controller's view */
                [self.view addSubview:imageView];
            }
            else{
                NSLog(@"Image isn't downloaded.NOthing to display");
            }
        });
    });
    
    //2
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

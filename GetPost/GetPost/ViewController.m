//
//  ViewController.m
//  GetPost
//
//  Created by duan on 13-3-21.
//  Copyright (c) 2013年 duan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//GET
@synthesize receivedData;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    //GET
    NSString *queryString = [NSString stringWithFormat: @"http://iyoapp.com/test/api/ios/upload/index.php?id=1"];
    NSURL *urlget = [NSURL URLWithString:queryString];
    NSMutableURLRequest *reqget = [NSMutableURLRequest requestWithURL:urlget];
    [reqget addValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [reqget addValue:0 forHTTPHeaderField:@"Content-Length"];
    [reqget setHTTPMethod:@"GET"];
    NSURLConnection *connget = [[NSURLConnection alloc] initWithRequest:reqget delegate:self];
    
    if (connget) {
        receivedData = [[NSMutableData data] retain];
    }
    
    
    //POST
//    NSString *postString =@"name=test";
//    NSURL *urlpost = [NSURL URLWithString:@"http://iyoapp.com/test/api/ios/upload/index.php"];
//    NSMutableURLRequest *reqpost = [NSMutableURLRequest requestWithURL:urlpost];
//    NSString *msgLength = [NSString stringWithFormat:@"%d", [postString length]];
//    [reqpost addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
//    [reqpost addValue:msgLength forHTTPHeaderField:@"Content-Length"];
//    [reqpost setHTTPMethod:@"POST"];
//    [reqpost setHTTPBody: [postString dataUsingEncoding:NSUTF8StringEncoding]];
//
//    NSURLConnection *connpost = [[NSURLConnection alloc] initWithRequest:reqpost delegate:self];
//    if (connpost) {    
//        receivedData = [[NSMutableData data] retain];
//    }
}


//GET POST
- (void)connection:(NSURLConnection *) connectiondidReceiveResponse:(NSURLResponse*)response
{
    [receivedData setLength:0];
}

- (void) connection:(NSURLConnection *) connection didReceiveData:(NSData *) data
{
    [receivedData appendData:data];
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    [connection release];
    [receivedData release];
    
    NSLog(@"Connection failed! Error - %@",[error localizedDescription]);
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString *result = [[NSString alloc] initWithData:receivedData encoding:NSUTF8StringEncoding];

    NSLog(@"succeeded  %d byte received:%@",[receivedData length],result);
    
    [connection release];
    [receivedData release];
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

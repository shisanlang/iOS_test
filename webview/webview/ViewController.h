//
//  ViewController.h
//  webview
//
//  Created by duan on 13-5-16.
//  Copyright (c) 2013年 duan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    UIWebView *webView;
    NSArray *NewsArray;
}

@property(nonatomic,retain) UIWebView *webView;
@property(nonatomic,retain) NSArray *NewsArray;

@end

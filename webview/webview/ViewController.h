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
    UIWebView *WebView;
    UIButton *ForwardButton;
    UIButton *BackButton;
    NSArray *NewsArray;
    UIActivityIndicatorView *activityIndicatorView;
}

@property(nonatomic,retain) UIWebView *WebView;
@property(nonatomic,retain) NSArray *NewsArray;

@end

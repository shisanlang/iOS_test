//
//  ViewController.m
//  Time
//
//  Created by duan on 13-10-30.
//  Copyright (c) 2013年 duan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSDateFormatter *formater = [[ NSDateFormatter alloc] init];
    [formater setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date=[formater dateFromString:@"2011-04-22 11:03:38"];
    NSLog(@"%@",date);


    NSDate *curDate = [NSDate date];//获取当前日期
    [formater setDateFormat:@"yyyy-MM-dd HH:mm:ss"];//这里去掉 具体时间 保留日期
    NSString * curTime = [formater stringFromDate:curDate];
    NSLog(@"%@",curTime);

    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formater setTimeZone:timeZone];
//    [formater release];
    
    //时间比较
    NSTimeInterval secondsPerDay = 24*60*60;
    NSDate *curDate2 = [NSDate date];
    NSDate *yesterDay = [curDate2 addTimeInterval:-secondsPerDay];////ios4以上系统
    NSTimeInterval secondsBetweenDates= [curDate2 timeIntervalSinceDate:yesterDay];
    NSLog(@"yesterDay = %@,%@",yesterDay,[curDate2 laterDate:yesterDay]);
    NSLog(@"secondsBetweenDates = %f,%f,%d", secondsBetweenDates, secondsPerDay, secondsBetweenDates>=secondsPerDay);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

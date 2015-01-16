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
    //    NSArray *languages = [NSLocale preferredLanguages];
    //    NSString *currentLanguage = [languages objectAtIndex:0];
    
    
//    NSString * modified = @"2011-01-12 12:34:25";
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    //[dateFormatter setLocale:[[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"] autorelease]];
//    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
//    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
//    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
//    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//    NSDate *date4 = [dateFormatter dateFromString:modified];
//    NSLog(@"date=%@",date4);

    
    
    NSDateFormatter *formater = [[ NSDateFormatter alloc] init];
//    [formater setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
//    [formater setLocale:[NSLocale currentLocale]];
//    [formater setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"]];
    [formater setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];//模拟器使用电脑时区
//    NSTimeZone* timeZone2 = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
//    NSTimeZone* timeZone3 = [NSTimeZone localTimeZone];
//    [formater setTimeZone:timeZone3];
//    [formater setDateStyle:kCFDateFormatterFullStyle];
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
    
    
    
    
    //时间戳 - now
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[dat timeIntervalSince1970];
    NSString *timeString = [NSString stringWithFormat:@"%.0f", a];
    NSLog(@"timestring = %@,%ld",timeString,(long)a);
    
    NSLog(@"%ld",time(NULL));
    
    
    //时间戳  - 时间
    NSDateFormatter *formaterI2T = [[ NSDateFormatter alloc] init];
    [formaterI2T setDateFormat:@"yyyy年MM月dd日 HH:mm"];
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:1296035591];
    NSLog(@"1296035591  = %@",confromTimesp);
    NSString *confromTimespStr = [formaterI2T stringFromDate:confromTimesp];
    NSLog(@"confromTimespStr =  %@",confromTimespStr);
    
    //ago  几天前 几周前
    NSString * strTime = @"2013年12月22日 16:13";
    NSDateFormatter *formaterAgo = [[ NSDateFormatter alloc] init];
//    [formaterAgo setTimeStyle:timeZone];
    [formaterAgo setDateFormat:@"yyyy年MM月dd日 HH:mm"];
    NSDate * dateAgo = [formaterAgo dateFromString:strTime];
    NSTimeInterval ago = [dateAgo timeIntervalSince1970];
    NSString *timeString2 = [NSString stringWithFormat:@"%.0f", ago];
    NSLog(@"ago = %@,%@",dateAgo,timeString2);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

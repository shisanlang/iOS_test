//
//  ViewController.m
//  location
//
//  Created by duan on 13-9-24.
//  Copyright (c) 2013年 duan. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

@synthesize PlaceLabel,PlaceLabel2;
@synthesize locationManager;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    PlaceLabel = [[UILabel alloc]initWithFrame:CGRectMake(40, 130, 240, 15)];
    PlaceLabel.text = @"";//[self localIPAddress];
    PlaceLabel.backgroundColor = [UIColor greenColor];
    [self.view addSubview:PlaceLabel];
    
    PlaceLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(40, 180, 240, 15)];
    PlaceLabel2.text = @"";//[self localIPAddress];
    PlaceLabel2.backgroundColor = [UIColor greenColor];
    [self.view addSubview:PlaceLabel2];
    
    
    locationManager = [[CLLocationManager alloc] init];//创建位置管理器
    locationManager.delegate=self;
    locationManager.desiredAccuracy=kCLLocationAccuracyBest;
    locationManager.distanceFilter=0.01;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    //启动位置更新
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(refresh) userInfo:nil repeats:YES];
    
//    [locationManager startUpdatingLocation];
}

- (void)refresh
{
    [locationManager startUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    PlaceLabel.text = [NSString stringWithFormat:@"%f------%f",oldLocation.coordinate.latitude,oldLocation.coordinate.longitude];
    PlaceLabel2.text = [NSString stringWithFormat:@"%f------%f",newLocation.coordinate.latitude,newLocation.coordinate.longitude];
}
-(void)locationManager:(CLLocationManager *)manager
      didFailWithError:(NSError *)error
{
    NSLog(@"error");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

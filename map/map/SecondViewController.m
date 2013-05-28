//
//  SecondViewController.m
//  map
//
//  Created by duan on 12-4-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SecondViewController.h"


@interface SecondViewController ()

@end

//
@interface customAnnotation : NSObject <MKAnnotation>
{
    CLLocationCoordinate2D coordinate;
    NSString * title;
    NSString * subtitle;
}

@property (nonatomic,readonly)CLLocationCoordinate2D coordinate;
@property (nonatomic,copy)NSString * title;
@property (nonatomic,copy)NSString * subtitle;

- (id)initWithCoordinate:(CLLocationCoordinate2D)coords;
@end

@implementation customAnnotation
@synthesize coordinate,title,subtitle;

- (id)initWithCoordinate:(CLLocationCoordinate2D)coords{
    if (self == [super init]) {
        coordinate = coords;
    }
    return self;
}

//- (void)dealloc
//{
//    [title release];
//    [subtitle release];
//    [super dealloc];
//}

@end


@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Second", @"Second");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}

-(MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    MKPinAnnotationView * pinView = (MKAnnotationView *)[map dequeueReusableAnnotationViewWithIdentifier:annotation.title];
    if (pinView == nil) {
        pinView = [[MKAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:annotation.title];
    } else {
        pinView.annotation = annotation;
    }
//    pinView.animatesDrop = YES;
//    [pinView setImage:[UIImage imageNamed:@"first.png"]];
    pinView.canShowCallout = TRUE;
    return pinView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    //系统 Map
    map = [[MKMapView alloc] initWithFrame:[self.view bounds]];
    map.mapType = MKMapTypeStandard;//
//    map.delegate = self;
    
    //位置
    map.showsUserLocation = YES;
    //精度
    CLLocationCoordinate2D coords;
    coords.latitude = 37.331689;
    coords.longitude = -122.030731;
    //坐标
    float zoomLevel = 0.018;
    MKCoordinateRegion region =MKCoordinateRegionMake(coords,MKCoordinateSpanMake(zoomLevel,zoomLevel));
    [map setRegion:[map regionThatFits:region] animated:YES];
    //委托
//    customAnnotation *annotation = [[customAnnotation alloc]initWithCoordinate:coords];
//    annotation.title = @"The Title";
//    annotation.subtitle = @"Subtitle";
//    [map addAnnotation:annotation];
    
    
//    [self.view addSubview:map];
    
    //高德
    NSString * gdMapUrl = @"iosamap://navi?sourceApplication=map123&backScheme=dxdmap&poiname=fangheng&poiid=BGVIS&lat=36.547901&lon=104.258354&dev=1&style=2";
    
    //百度
    NSString * baiduMapUrl = @"baidumap://map/direction?origin=中关村&destination=五道口&mode=driving&region=北京";
    baiduMapUrl = [baiduMapUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    //Google
    NSString * googleMapUrl = @"comgooglemaps://?center=40.765819,-73.975866&zoom=14&views=traffic";
    
//    NSString *googleMapUrl=[[NSString alloc] initWithFormat:@"http://maps.google.com/maps?q=%f,%f+(%@)",coords.latitude,coords.longitude,@"title"];
//    NSString * googleMapUrl = @"baidumap://map/place/search?q=银行&region=北京";
    
    //iOS系统
    NSString * appleMapUrl = @"http://maps.apple.com/?daddr=San+Francisco,+CA&saddr=cupertino";
    
    
    if ([[UIApplication sharedApplication] openURL:[NSURL URLWithString:appleMapUrl]]) {
        ;
    } else if ([[UIApplication sharedApplication] openURL:[NSURL URLWithString:baiduMapUrl]]) {
        ;
    } else if ([[UIApplication sharedApplication] openURL:[NSURL URLWithString:googleMapUrl]]) {
        ;
    } else if ([[UIApplication sharedApplication] openURL:[NSURL URLWithString:gdMapUrl]]) {
        ;
    }
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end

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
    
    
    [self.view addSubview:map];
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

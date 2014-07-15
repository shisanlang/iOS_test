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

@synthesize PlaceLabel,PlaceLabel2,PlaceLabel3;
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
    
    PlaceLabel3 = [[UILabel alloc]initWithFrame:CGRectMake(40, 200, 240, 15)];
    PlaceLabel3.text = @"";//[self localIPAddress];
    PlaceLabel3.backgroundColor = [UIColor greenColor];
    [self.view addSubview:PlaceLabel3];
    
    
    locationManager = [[CLLocationManager alloc] init];//创建位置管理器
    locationManager.delegate=self;
    locationManager.desiredAccuracy=kCLLocationAccuracyBest;
    locationManager.distanceFilter=0.01;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    //启动位置更新
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(refresh) userInfo:nil repeats:YES];
    
//    [locationManager startUpdatingLocation];
    
    //http://maps.google.com/maps/api/geocode/json?latlng=40.714224,-73.961452&sensor=true&language=en

    
    //
//    for (NSString * l in [NSLocale preferredLanguages] ) {
//        NSLog(@"l = %@",l);
//    }
}

- (void)refresh
{
    [locationManager startUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    PlaceLabel.text = [NSString stringWithFormat:@"%f@--@%f",oldLocation.coordinate.latitude,oldLocation.coordinate.longitude];
    PlaceLabel2.text = [NSString stringWithFormat:@"%f@--@%f",newLocation.coordinate.latitude,newLocation.coordinate.longitude];
    
    //------------------位置反编码---5.0之后使用-----------------
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:newLocation
                   completionHandler:^(NSArray *placemarks, NSError *error){
                       for (CLPlacemark *place in placemarks) {
                           
                           NSLog(@"__________________________");
                           NSLog(@"country,%@",place.country);                 // 国家
                           NSLog(@"province,%@",place.administrativeArea);     // 省
                           NSLog(@"locality,%@",place.locality);               // 市
                           NSLog(@"subLocality,%@",place.subLocality);         // 区
                           NSLog(@"thoroughfare,%@",place.thoroughfare);       // 街道
                           NSLog(@"subThoroughfare,%@",place.subThoroughfare); // 子街道
                           NSLog(@"name,%@",place.name);                       // 位置名
                           
                           
                           NSLog(@"@1@%@#%@#%@#%@",place.name,place.thoroughfare,place.subThoroughfare,place.locality);
                           NSLog(@"@2@%@#%@#%@#%@",place.administrativeArea,place.subAdministrativeArea,place.postalCode,place.ISOcountryCode);
                           NSLog(@"@3@%@#%@#%@#%@#%@",place.subLocality,place.country,place.inlandWater,place.ocean,place.areasOfInterest);
                           //省    市 administrativeArea   区县  subLocality    详细
                           
                           PlaceLabel3.text = place.country;
                           NSLog(@"---------------------------");

                       }
                   }
     ];
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


#define CURR_LANG                        ([[NSLocale preferredLanguages] objectAtIndex:0])
+ (NSString *)DPLocalizedString:(NSString *)translation_key {
    
    NSString * s = NSLocalizedString(translation_key, nil);
    if (![CURR_LANG isEqual:@"en"] && ![CURR_LANG isEqual:@"zh-Hans"]) {
        NSString * path = [[NSBundle mainBundle] pathForResource:@"zh-Hans" ofType:@"lproj"];//zh-Hans.lproj
        NSBundle * languageBundle = [NSBundle bundleWithPath:path];
        s = [languageBundle localizedStringForKey:translation_key value:@"" table:nil];
    }
    return s;
}
@end

//
//  ViewController.h
//  location
//
//  Created by duan on 13-9-24.
//  Copyright (c) 2013年 duan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController<CLLocationManagerDelegate>

@property(nonatomic,retain) UILabel * PlaceLabel;
@property(nonatomic,retain) UILabel * PlaceLabel2;
@property(nonatomic,retain) CLLocationManager *locationManager;

@end

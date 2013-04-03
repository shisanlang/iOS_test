//
//  SecondViewController.h
//  map
//
//  Created by duan on 12-4-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface SecondViewController : UIViewController<MKMapViewDelegate>
{
    MKMapView * map;
}
@end

//
//  DeviceInfo.h
//  device
//
//  Created by shisan lang on 11-10-24.
//  Copyright 2011年 BeiJingChaoYangQu. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DeviceInfo : NSObject {
    NSString * DeviceID;		//9A2E9896-2475-5AD3-B52F-0D6D8BCE0FC2
	NSString * LocalizedModel;	//iPhone Simulator
	NSString * SystemName;		//iPhone OS
	NSString * SystemVersion;	//4.2
	NSString * Model;			//iPhone Simulator
    NSString * Version;         //软件版本1.1
    NSString * BuildVersion;    //软件版本1.1.0
    NSString * DeviceName;      //设备名称
}

@property(nonatomic, retain) NSString * DeviceID;
@property(nonatomic, retain) NSString * LocalizedModel;
@property(nonatomic, retain) NSString * SystemName;
@property(nonatomic, retain) NSString * SystemVersion;
@property(nonatomic, retain) NSString * Model;
@property(nonatomic, retain) NSString * Version;
@property(nonatomic, retain) NSString * BuildVersion;
@property(nonatomic, retain) NSString * DeviceName;

//-(void) GetInfo;
//-(void) print;

@end

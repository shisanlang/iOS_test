//
//  common.h
//  TableView
//
//  Created by duan on 13-3-22.
//  Copyright (c) 2013年 duan. All rights reserved.
//

#ifndef TableView_common_h
#define TableView_common_h


#endif


//Log
#ifdef DEBUG
#define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define DLog(...)
#endif

#define ALog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);


//Color
#define RGB(r, g, b) \
[UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define RGBA(r, g, b, a) \
[UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]


//屏幕 括号中的数字只是说明3.5`屏
#define XD_FULLSCREENSTATE [[UIScreen mainScreen] bounds] //包含状态栏 480 (固定480)
#define XD_FULLSCREENRECT [[UIScreen mainScreen] applicationFrame] //不包含状态栏 460 (有状态条460,无状态条480)

#define XD_SCREENHEIGHT [[UIScreen mainScreen] applicationFrame].size.height


//友盟
#define UMENG_KEY @"505c36cf52701566050000e1_channel"
#define UMENG_CHANNEL_APPSTORE @"App Store"
#define UMENG_CHANNEL_91STORE  @"91 Store"
#define UMENG_CHANNEL_WEIPHONE @"weiphone"
#define UMENG_CHANNEL_CANDOU   @"Candou"
#define UMENG_CHANNEL_SOHU     @"sohu"

#define UMENG_CHANNEL_TONGBU   @"tongbu"
#define UMENG_CHANNEL_CHEXUN   @"chexun"
#define UMENG_CHANNEL_QUDAO1   @"Qudao1"
#define UMENG_CHANNEL_QUDAO2   @"Qudao2"
#define UMENG_CHANNEL_QUDAO3   @"Qudao3"








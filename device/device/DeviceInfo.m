//
//  DeviceInfo.m
//  device
//
//  Created by shisan lang on 11-10-24.
//  Copyright 2011年 BeiJingChaoYangQu. All rights reserved.
//

#import "DeviceInfo.h"
//mac
#include <sys/socket.h> // Per msqr
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>
//ip
#include <arpa/inet.h>
#include <netdb.h>
#include <net/if.h>
#include <ifaddrs.h>
#import <dlfcn.h>
//#import "wwanconnect.h//frome apple 你可能没有哦
#import <SystemConfiguration/SystemConfiguration.h>

#import "Reachability.h"
#import <sys/utsname.h>
#import <sys/sysctl.h>//查看进程

@implementation DeviceInfo

@synthesize DeviceID;
@synthesize LocalizedModel;
@synthesize SystemName;
@synthesize SystemVersion;
@synthesize Model;
@synthesize Version;
@synthesize ShortVersion;
@synthesize DeviceName;

#pragma mark init
- (id)init
{
    self = [super init];
    if (self != nil) {
        
    }
    [self GetInfo];
    return self;
}

#pragma mark nslog
- (NSString *)description
{
    NSArray * descWordArray = @[
                                /********设备信息********/
                                @"程序类型:", [self IsiPhoneSystem]?@"iPhone":@"iPad",
                                @"设备:", [self deviceStringInfo],
                                @"设备名称:", self.DeviceName,
                                @"设备ID:", self.DeviceID,
                                @"当前设备模型:", self.LocalizedModel,
                                @"设备模型:", self.Model,
                                @"具体设备:", [self deviceStringInfo],
                                @"CPU:", @"",
                                @"磁盘:", @"",
                                @"内存:", [NSString stringWithFormat:@"%u", [self getTotalMemory]],
                                @"分辨率:", [self getScreenSize],
                                /********系统信息********/
                                @"操作系统:", self.SystemName,
                                @"操作系统版本:", self.SystemVersion,
                                @"是否越狱:", [self isJailbroken]?@"是":@"否",
                                @"应用程序个数:", @"",
                                @"歌曲首数:", @"",
                                /********网络信息********/
                                @"是否为飞行模式:", @"否",
                                @"主机名称:", [self hostname],
                                @"当前网络连接状态:", @"可用",
                                @"当前网络方式:", [self IsEnableWifi]?@"WIFI":[self IsEnable3G]?@"3G/GPRS":@"无网络",//@"wifi",
                                @"网关IP地址:", @"127.0.0.1",
                                @"DNS IP地址:", @"127.0.0.1",
                                @"DHCP IP地址:", @"127.0.0.1",
                                @"Mac地址:", [self macaddress],//@"8c-7c-2a-5b",
                                @"IP地址v4:", [self localIPAddress],//[self getIPAddressForHost],//[self localWiFiIPAddress],//[self whatismyipdotcom],//@"127.0.0.1",
                                @"IP地址v6:", [self getAddress],
                                @"子网掩码:", @"255.255.255.0",
                                /********APP信息********/
                                @"本软件版本(Build):", self.Version,     //1.1
                                @"本软件版本(Version):", self.ShortVersion   //1.1.0
                                /**********************/
                                
                                ];
    
    
    NSString * descWord = @"";
    for (int i=0; i<[descWordArray count]; i++) {
        descWord = [NSString stringWithFormat:@"%@%@", descWord,[descWordArray objectAtIndex:i]];
        if (i%2!=0) {
            descWord = [NSString stringWithFormat:@"%@%@", descWord, @"\n"];
        }
    }
    return descWord;
    
}

//未打印
//    [self getThreadSize];

//获取手机的imei
//[[NSUserDefaults standardUserDefaults] valueForKey:@"SBFormattedPhoneNumber"];
//获取手机的imei
//#import "Message/NetworkController.h"
//NetworkController *ntc=[[NetworkController sharedInstance] autorelease];
//NSString *imeistring = [ntc IMEI];
//imeistring就是获取的imei。 IMEI(International Mobile Equipment Identity)是国际移动设备身份码的缩写，
//国际移动装备辨识码，是由15位数字组成的"电子串号"，它与每台手机一一对应，而且该码是全世界唯一的。

- (void)PrintAppKey
{
        //获取系统info.plist文件中的键值对
        NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];
        //获取软件的版本号
        NSString *version = [infoDict objectForKey:@"CFBundleVersion"];
        NSLog(@"版本号是=%@",version);

        //打印系统plist中所有的键值对
        for (id key in infoDict) {
            NSLog(@"key:%@,value:%@",key,[infoDict objectForKey:key]);
        }

}

- (void)PrintPro
{
    NSLog(@"\n/********进程信息********");
    NSArray * processes = [self runningProcesses];
    for (NSDictionary * dict in processes){
        NSLog(@"%@ - %@", [dict objectForKey:@"ProcessID"], [dict objectForKey:@"ProcessName"]);
    }
}


- (NSString *)debugDescription
{
    return @"debugDescription";
}


#pragma mark device info
/*******************************************************设备信息**************************************************/


-(void) GetInfo {
	self.DeviceID = @"";//[[UIDevice currentDevice]uniqueIdentifier];     //UDID
	self.LocalizedModel = [[UIDevice currentDevice]localizedModel];
	self.SystemName = [[UIDevice currentDevice]systemName];
	self.SystemVersion = [[UIDevice currentDevice]systemVersion];
	self.Model = [[UIDevice currentDevice]model];
    self.Version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    self.ShortVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
	self.DeviceName = [[UIDevice currentDevice] name];
}



// 设备类型
- (BOOL) IsiPhoneSystem {
    return ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone);
}
// 是否wifi
- (BOOL) IsEnableWifi {
    //    return NO;
    return ([[Reachability reachabilityForLocalWiFi] currentReachabilityStatus] != NotReachable);
}
// 是否3G
- (BOOL) IsEnable3G {
    return ([[Reachability reachabilityForInternetConnection] currentReachabilityStatus] != NotReachable);
}
//是否越狱
- (BOOL)isJailbroken {
    BOOL jailbroken = NO;
    NSString *cydiaPath = @"/Applications/Cydia.app";
    NSString *aptPath = @"/private/var/lib/apt/";
    if ([[NSFileManager defaultManager] fileExistsAtPath:cydiaPath]) {
        jailbroken = YES;
    }
    if ([[NSFileManager defaultManager] fileExistsAtPath:aptPath]) {
        jailbroken = YES;
    }
    return jailbroken;
}
//显示网络连接状态 运营商右侧 转圈的
//UIApplication *app = [UIApplication sharedApplication];
//app.networkActivityIndicatorVisible = YES;


//设备信息
- (NSString *) deviceStringInfo
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    NSLog(@"NOTE: device type: %@", deviceString);
    
    if ([deviceString isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    if ([deviceString isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([deviceString isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([deviceString isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([deviceString isEqualToString:@"iPhone3,2"])    return @"Verizon iPhone 4";
    if ([deviceString isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([deviceString isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([deviceString isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([deviceString isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([deviceString isEqualToString:@"iPod5,1"])      return @"iPod Touch 5G";
    if ([deviceString isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([deviceString isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([deviceString isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
    if ([deviceString isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([deviceString isEqualToString:@"i386"])         return @"Simulator";
    if ([deviceString isEqualToString:@"x86_64"])       return @"Simulator";
    
    return deviceString;
}


#pragma mark network info
/*******************************************************网络信息**************************************************/


//取得ip

-(NSString *)getAddress
{
    char iphone_ip[255];
    strcpy(iphone_ip,"127.0.0.1"); // if everything fails
    NSHost* myhost =[NSHost currentHost];
    if (myhost)
    {
        NSString *ad = [myhost address];
        if (ad)
            strcpy(iphone_ip,[ad cStringUsingEncoding:NSASCIIStringEncoding]);
    }
    return [NSString stringWithFormat:@"%s",iphone_ip];
}


//取得mac地址

- (NSString *) macaddress
{
    int                    mib[6];
    size_t                len;
    char                *buf;
    unsigned char        *ptr;
    struct if_msghdr    *ifm;
    struct sockaddr_dl    *sdl;
    
    mib[0] = CTL_NET;
    mib[1] = AF_ROUTE;
    mib[2] = 0;
    mib[3] = AF_LINK;
    mib[4] = NET_RT_IFLIST;
    
    if ((mib[5] = if_nametoindex("en0")) == 0) {
        printf("Error: if_nametoindex error\n");
        return NULL;
    }
    
    if (sysctl(mib, 6, NULL, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 1\n");
        return NULL;
    }
    
    if ((buf = malloc(len)) == NULL) {
        printf("Could not allocate memory. error!\n");
        return NULL;
    }
    
    if (sysctl(mib, 6, buf, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 2");
        return NULL;
    }
    
    ifm = (struct if_msghdr *)buf;
    sdl = (struct sockaddr_dl *)(ifm + 1);
    ptr = (unsigned char *)LLADDR(sdl);
    // NSString *outstring = [NSString stringWithFormat:@"%02x:%02x:%02x:%02x:%02x:%02x", *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
    NSString *outstring = [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x", *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
    free(buf);
    return [outstring uppercaseString];
}


//wifi ip

//- (NSString *) whatismyipdotcom
//{
//    NSError *error;
//    NSURL *ipURL = [NSURL URLWithString:@"http://www.whatismyip.com/automation/n09230945.asp"];
//    NSString *ip = [NSString stringWithContentsOfURL:ipURL encoding:1 error:&error];
//    return ip ? ip : [error localizedDescription];
//}


//- (NSString *) localWiFiIPAddress
//{
//    BOOL success;
//    struct ifaddrs * addrs;
//    const struct ifaddrs * cursor;
//    
//    success = getifaddrs(&addrs) == 0;
//    if (success) {
//        cursor = addrs;
//        while (cursor != NULL) {
//            // the second test keeps from picking up the loopback address
//            if (cursor->ifa_addr->sa_family == AF_INET && (cursor->ifa_flags & IFF_LOOPBACK) == 0) 
//            {
//                NSString *name = [NSString stringWithUTF8String:cursor->ifa_name];
//                if ([name isEqualToString:@"en0"])  // Wi-Fi adapter
//                    return [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)cursor->ifa_addr)->sin_addr)];
//            }
//            cursor = cursor->ifa_next;
//        }
//        freeifaddrs(addrs);
//    }
//    return nil;
//}


//+ (NSString *) stringFromAddress: (const struct sockaddr *) address
//{
//    if(address && address->sa_family == AF_INET) {
//        const struct sockaddr_in* sin = (struct sockaddr_in*) address;
//        return [NSString stringWithFormat:@"%@:%d", [NSString stringWithUTF8String:inet_ntoa(sin->sin_addr)], ntohs(sin->sin_port)];
//    }
//    
//    return nil;
//}


//+ (BOOL)addressFromString:(NSString *)IPAddress address:(struct sockaddr_in *)address
//{
//    if (!IPAddress || ![IPAddress length]) {
//        return NO;
//    }
//    
//    memset((char *) address, sizeof(struct sockaddr_in), 0);
//    address->sin_family = AF_INET;
//    address->sin_len = sizeof(struct sockaddr_in);
//    
//    int conversionResult = inet_aton([IPAddress UTF8String], &address->sin_addr);
//    if (conversionResult == 0) {
//        NSAssert1(conversionResult != 1, @"Failed to convert the IP address string into a sockaddr_in: %@", IPAddress);
//        return NO;
//    }
//    
//    return YES;
//}


//获取host的名称

- (NSString *) hostname
{
    char baseHostName[256]; // Thanks, Gunnar Larisch
    int success = gethostname(baseHostName, 255);
    if (success != 0) return nil;
    baseHostName[255] = '\0';
    
    #if TARGET_IPHONE_SIMULATOR
        return [NSString stringWithFormat:@"%s", baseHostName];
    #else
        return [NSString stringWithFormat:@"%s.local", baseHostName];
    #endif
}


//从host获取地址

//- (NSString *) getIPAddressForHost: (NSString *) theHost
//{
//    struct hostent *host = gethostbyname([theHost UTF8String]);
//    if (!host) {herror("resolv"); return NULL; }
//    struct in_addr **list = (struct in_addr **)host->h_addr_list;
//    NSString *addressString = [NSString stringWithCString:inet_ntoa(*list[0]) encoding:NSUTF8StringEncoding];
//    return addressString;
//}


//这是本地host的IP地址
- (NSString *) localIPAddress
{
    struct hostent *host = gethostbyname([[self hostname] UTF8String]);
    if (!host) {herror("resolv"); return nil;}
    struct in_addr **list = (struct in_addr **)host->h_addr_list;
    return [NSString stringWithCString:inet_ntoa(*list[0]) encoding:NSUTF8StringEncoding];
}

//- (NSString *) wifi
//{
//    Reachability *r = [Reachability reachabilityWithHostName:@“www.apple.com”];
//    switch ([r currentReachabilityStatus]) {
//        case NotReachable:
//            // 没有网络连接
//            break;
//        case ReachableViaWWAN:
//            // 使用3G网络
//            break;
//        case ReachableViaWiFi:
//            // 使用WiFi网络
//            break;
//    }
//}

/*******************************************************系统信息**************************************************/

//CPU 内存
- (NSString *) getSysInfoByName:(char *)typeSpecifier
{
    size_t size;
    sysctlbyname(typeSpecifier, NULL, &size, NULL, 0);
    char *answer = malloc(size);
    sysctlbyname(typeSpecifier, answer, &size, NULL, 0);
    NSString *results = [NSString stringWithCString:answer encoding: NSUTF8StringEncoding];
    free(answer);
    return results;
}
//获取平台信息
+ (NSString *) platform
{
    return [self getSysInfoByName:"hw.machine"];
}
- (NSUInteger) getSysInfo: (uint) typeSpecifier
{
    size_t size = sizeof(int);
    int results;
    int mib[2] = {CTL_HW, typeSpecifier};
    sysctl(mib, 2, &results, &size, NULL, 0);
    return (NSUInteger) results;
}
//线程的堆栈大小 
void *threadFunc(void *arg) {
    void*  stack_base = pthread_get_stackaddr_np(pthread_self());
    size_t stack_size = pthread_get_stacksize_np(pthread_self());
    NSLog(@"Thread: base:%p / size:%u", stack_base, stack_size);
    return NULL;
}

- (void) getThreadSize
{
    void*  stack_base = pthread_get_stackaddr_np(pthread_self());
    size_t stack_size = pthread_get_stacksize_np(pthread_self());
    struct rlimit limit;
    getrlimit(RLIMIT_STACK, &limit);
    NSLog(@"Main thread: base:%p / size:%u", stack_base, stack_size);
    NSLog(@"  rlimit-> soft:%llu / hard:%llu", limit.rlim_cur, limit.rlim_max);
    
    pthread_t thread;
    pthread_create(&thread, NULL, threadFunc, NULL);
}


//获取CPU频率
- (NSUInteger) getCpuFrequency
{
    return [self getSysInfo:HW_CPU_FREQ];
}
//获取总线频率
- (NSUInteger) getBusFrequency
{
    return [self getSysInfo:HW_BUS_FREQ];
}
//获取总的内存大小
- (NSUInteger) getTotalMemory
{
    return [self getSysInfo:HW_PHYSMEM];
}
//获取用户内存
- (NSUInteger) getUserMemory
{
    return [self getSysInfo:HW_USERMEM];
}
//获取socketBufferSize
- (NSUInteger) maxSocketBufferSize
{
    return [self getSysInfo:KIPC_MAXSOCKBUF];
}
//iphone下获取可用的内存大小
//- (NSUInteger)getAvailableMemory
//{
//    vm_statistics_data_t vmStats;
//    mach_msg_type_number_t infoCount = HOST_VM_INFO_COUNT;
//    kern_return_t kernReturn = host_statistics(mach_host_self(), HOST_VM_INFO, (host_info_t)&vmStats, &infoCount);
//    if(kernReturn != KERN_SUCCESS)
//        return NSNotFound;
//    return (vm_page_size * vmStats.free_count);// / 1024.0) / 1024.0;
//}
//分分辨率
- (NSString *) getScreenSize
{
    CGRect rect = [[UIScreen mainScreen] bounds];
    CGSize size = rect.size;
    CGFloat width = size.width;
    CGFloat height = size.height;
    return [NSString stringWithFormat:@"%dx%d",(int)height,(int)width];
}
//运营商
+ (NSString*)getCarrier:(NSString*)imsi //或 CoreTelephony 框架
{
    if (imsi == nil || [imsi isEqualToString:@"SIM Not Inserted"] ) {
        return @"Unknown";
    }
    else {
        if ([[imsi substringWithRange:NSMakeRange(0, 3)] isEqualToString:@"460"]) {
            NSInteger MNC = [[imsi substringWithRange:NSMakeRange(3, 2)] intValue];
            switch (MNC) {
                case 00:
                case 02:
                case 07:
                    return @"China Mobile";
                    break;
                case 01:
                case 06:    
                    return @"China Unicom";
                    break;
                case 03:
                case 05:    
                    return @"China Telecom";
                    break;
                case 20:
                    return @"China Tietong";
                    break;
                default:
                    break;
            }
        }
    }
    return @"Unknown";
}

- (NSArray *)runningProcesses {
    
    int mib[4] = {CTL_KERN, KERN_PROC, KERN_PROC_ALL, 0};
    size_t miblen = 4;
    
    size_t size;
    int st = sysctl(mib, miblen, NULL, &size, NULL, 0);
    
    struct kinfo_proc * process = NULL;
    struct kinfo_proc * newprocess = NULL;
    
    do {
        
        size += size / 10;
        newprocess = realloc(process, size);
        
        if (!newprocess){
            
            if (process){
                free(process);
            }
            
            return nil;
        }
        
        process = newprocess;
        st = sysctl(mib, miblen, process, &size, NULL, 0);
        
    } while (st == -1 && errno == ENOMEM);
    
    if (st == 0){
        
        if (size % sizeof(struct kinfo_proc) == 0){
            int nprocess = size / sizeof(struct kinfo_proc);
            
            if (nprocess){
                
                NSMutableArray * array = [[NSMutableArray alloc] init];
                
                for (int i = nprocess - 1; i >= 0; i--){
                    
                    NSString * processID = [[NSString alloc] initWithFormat:@"%d", process[i].kp_proc.p_pid];
                    NSString * processName = [[NSString alloc] initWithFormat:@"%s", process[i].kp_proc.p_comm];
                    
                    NSDictionary * dict = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:processID, processName, nil]
                                                                        forKeys:[NSArray arrayWithObjects:@"ProcessID", @"ProcessName", nil]];
                    [processID release];
                    [processName release];
                    [array addObject:dict];
                    [dict release];
                }
                
                free(process);
                return [array autorelease];
            }
        }
    }
    
    return nil;
}






//- (void)dealloc
//{
//	[DeviceID release];
//	[LocalizedModel release];
//	[SystemName release];
//	[SystemVersion release];
//	[Model release];
//	[Version release];
//	[super dealloc];
//}

@end

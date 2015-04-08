//
//  DeviceInfo.m
//  JWKit
//
//  Created by Jhonathan Wyterlin on 2/13/15.
//  Copyright (c) 2015 Jhonathan Wyterlin. All rights reserved.
//

#import "DeviceInfo.h"
#import "UIDevice-Hardware.h"

@implementation DeviceInfo

@synthesize device = _device;

static CGFloat height;
static CGFloat width;
static BOOL isIphone5;

-(id)init {
    
    self = [super init];
    
    if ( self != nil ) {
        _device = [UIDevice currentDevice];
    }
    
    return self;
    
}

+(DeviceInfo *)sharedInstance {
    
    static dispatch_once_t p = 0;
    static DeviceInfo *sharedObject = nil;
    
    dispatch_once(&p, ^{
        sharedObject = [DeviceInfo new];
    });
    
    return sharedObject;
    
}

+(NSString *)getAppVersion {
    return [[DeviceInfo sharedInstance] getAppVersion];
}

-(NSString *)getAppVersion {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}

+(NSString *)getAppName {
   return [[DeviceInfo sharedInstance] getAppName];
}

-(NSString *)getAppName {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"];
}

+(NSString *)getDeviceOSVersion {
    return [[DeviceInfo sharedInstance] getDeviceOSVersion];
}

-(NSString *)getDeviceOSVersion {
    NSString *deviceSystemVersion = _device.systemVersion;
    return deviceSystemVersion;
}

+(NSString *)getDeviceName {
    return [[DeviceInfo sharedInstance] getDeviceName];
}

-(NSString *)getDeviceName {
    NSString *deviceName =_device.name;
    return deviceName;
}

+(NSString *)getDeviceModel {
    return [[[DeviceInfo sharedInstance] device] platformString];
}

-(NSString *)getDeviceModel {
    NSString *deviceModel = _device.model;
    return deviceModel;
}

-(NSString *)getDeviceUDID {
    
    NSString *openUDID = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    
    return openUDID;
    
}

+(BOOL)isIphone5 {
    
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    
    isIphone5 = ( screenBounds.size.height == 568 );
    
    height = screenBounds.size.height;
    width  = screenBounds.size.width;
    
    return isIphone5;
    
}

+(CGFloat)height {
    
    if ( height == 0 ) {
        CGRect screenBounds = [[UIScreen mainScreen] bounds];
        height  = screenBounds.size.height;
    }
    
    return height;
    
}

+(CGFloat)width {
    
    if ( width == 0 ) {
        CGRect screenBounds = [[UIScreen mainScreen] bounds];
        width = screenBounds.size.width;
    }
    
    return width;
    
}

+(BOOL)isIphone3Dot5Inches {
    
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    
    return ( screenBounds.size.height == 480 );
    
}

+(CGFloat)nativeScale {
    
    if ( [[UIScreen mainScreen] respondsToSelector:@selector(nativeScale)] )
        return [UIScreen mainScreen].nativeScale;
    
    return 3.0;
    
}

@end

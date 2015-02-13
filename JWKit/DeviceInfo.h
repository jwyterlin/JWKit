//
//  DeviceInfo.h
//  JWKit
//
//  Created by Jhonathan Wyterlin on 2/13/15.
//  Copyright (c) 2015 Jhonathan Wyterlin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DeviceInfo : NSObject

@property (nonatomic, strong) UIDevice *device;

+(NSString *)getAppVersion;
+(NSString *)getAppName;
+(NSString *)getDeviceOSVersion;
+(NSString *)getDeviceName;
+(NSString *)getDeviceModel;
-(NSString *)getDeviceUDID;
+(BOOL)isIphone5;
+(CGFloat)height;
+(CGFloat)width;
+(BOOL)isIphone3Dot5Inches;

@end

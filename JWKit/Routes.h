//
//  Routes.h
//  JWKit
//
//  Created by Jhonathan Wyterlin on 2/13/15.
//  Copyright (c) 2015 Jhonathan Wyterlin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Routes : NSObject

+(NSString *)BASE_URL;
+(NSString *)BASEAPI_URL;
+(NSString *)API_VERSION_URL;

// These three routes are just one example
+(NSString *)WS_USER;
+(NSString *)WS_PRODUCT;
+(NSString *)WS_SHOP;

@end

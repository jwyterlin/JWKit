//
//  Routes.m
//  JWKit
//
//  Created by Jhonathan Wyterlin on 2/13/15.
//  Copyright (c) 2015 Jhonathan Wyterlin. All rights reserved.
//

#import "Routes.h"

@implementation Routes

+(NSString *)BASE_URL {
#ifdef RELEASE
    return @"https://api.officialdomain.com/";
#else
    return @"https://api.develpmontdomain.com.br/";
#endif
}

+(NSString *)BASEAPI_URL {
    return [NSString stringWithFormat:@"%@%@/",[Routes BASE_URL],[Routes API_VERSION_URL]];
}

+(NSString *)API_VERSION_URL {
    return @"v1";
}

// These three routes are just one example
+(NSString *)WS_USER {
    return @"user";
}

+(NSString *)WS_PRODUCT {
    return @"product";
}

+(NSString *)WS_SHOP {
    return @"shop";
}

@end

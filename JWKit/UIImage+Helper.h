//
//  UIImage+Helper.h
//  JWKit
//
//  Created by Jhonathan Wyterlin on 28/07/15.
//  Copyright (c) 2015 Jhonathan Wyterlin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIImage (Helper)

+(UIImage *)imageWithColor:(UIColor *)color;
+(UIImage *)imageWithColor:(UIColor *)color andSize:(CGSize)size;

@end

//
//  UIButton+Helper.h
//  JWKit
//
//  Created by Jhonathan Wyterlin on 16/05/15.
//  Copyright (c) 2015 Jhonathan Wyterlin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIButton (Helper)

-(void)setTitle:(NSString *)title;
-(void)setTitleColor:(UIColor *)color;
-(void)roundCorner;
-(void)putBorderColor;
-(void)putBorderColor:(UIColor *)color;
-(void)putBorderWidth;
-(void)putBorderWidth:(CGFloat)width;

@end

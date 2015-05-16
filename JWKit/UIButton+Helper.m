//
//  UIButton+Helper.m
//  JWKit
//
//  Created by Jhonathan Wyterlin on 16/05/15.
//  Copyright (c) 2015 Jhonathan Wyterlin. All rights reserved.
//

#import "UIButton+Helper.h"

@implementation UIButton (Helper)

-(void)setTitle:(NSString *)title {
    
    [self setTitle:title forState:UIControlStateNormal];
    [self setTitle:title forState:UIControlStateHighlighted];
    [self setTitle:title forState:UIControlStateSelected];
    
}

-(void)setTitleColor:(UIColor *)color {
    
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    
}

-(void)roundCorner {
    
    self.layer.cornerRadius = 5.0;
    
}

-(void)putBorderColor {
    
    self.layer.borderColor = [UIColor blackColor].CGColor;
    
}

-(void)putBorderColor:(UIColor *)color {
    
    self.layer.borderColor = color.CGColor;
    
}

-(void)putBorderWidth {
    
    self.layer.borderWidth = 1.0;
    
}

-(void)putBorderWidth:(CGFloat)width {
    
    self.layer.borderWidth = width;
    
}

@end

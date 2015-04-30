//
//  CircleView.m
//  JWKit
//
//  Created by Jhonathan Wyterlin on 30/04/15.
//  Copyright (c) 2015 Jhonathan Wyterlin. All rights reserved.
//

#import "CircleView.h"

@implementation CircleView

-(id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        // Initialization code
    }
    
    return self;
    
}

-(void)drawRect:(CGRect)rect {
    
    CGFloat rectX = self.frame.size.width / 2;
    CGFloat rectY = self.frame.size.height / 2;
    CGFloat width = self.frame.size.width-3;
    CGFloat height = self.frame.size.height-3;
    CGFloat centerX = rectX - width/2;
    CGFloat centerY = rectY - height/2;
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(centerX, centerY, width, height)];
    
    // Border
    if ( self.borderColor )
        [self.borderColor set];
    else
        [[UIColor blackColor] set];
    
    [bezierPath fill];
    
    // Fill
    int coefficientToCenter = 2;
    int coefficientToShrink = 2 * coefficientToCenter;
    
    UIBezierPath *bezierPathFill = [UIBezierPath bezierPathWithOvalInRect:CGRectMake( centerX+coefficientToCenter,
                                                                                     centerY+coefficientToCenter,
                                                                                     width-coefficientToShrink,
                                                                                     height-coefficientToShrink)];
    
    if ( self.fillColor )
        [self.fillColor set];
    else
        [[UIColor blackColor] set];
    
    [bezierPathFill fill];
    
}

@end

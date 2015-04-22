//
//  ButtonHelper.m
//  JWKit
//
//  Created by Jhonathan Wyterlin on 21/04/15.
//  Copyright (c) 2015 Jhonathan Wyterlin. All rights reserved.
//

#import "ButtonHelper.h"

@implementation ButtonHelper

-(void)roundCornerButton:(UIButton *)button {
    button.layer.cornerRadius = 5.0;
}

-(void)roundCornerButtons:(NSArray *)buttons {
    
    for ( UIButton *button in buttons )
        [self roundCornerButton:button];
    
}

@end

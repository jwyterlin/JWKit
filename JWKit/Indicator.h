//
//  Indicator.h
//  JWKit
//
//  Created by Jhonathan Wyterlin on 17/05/15.
//  Copyright (c) 2015 Jhonathan Wyterlin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Indicator : NSObject

+(instancetype)shared;

-(void)showIndicatorWithLabel:(NSString *)label
               viewController:(UIViewController *)viewController;

-(void)showIndicatorDialogWithMessage:(NSString *)message
                       viewController:(UIViewController *)viewController;

-(void)stopIndicatorInViewController:(UIViewController *)viewController;

@end

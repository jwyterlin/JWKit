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

-(void)showIndicatorWithLabel:(NSString *)label
                     delegate:(id)delegate
                         view:(UIView *)view;

-(void)showIndicatorDialogWithMessage:(NSString *)message
                       viewController:(UIViewController *)viewController;

-(void)showIndicatorDialogWithMessage:(NSString *)message
                             delegate:(id)delegate
                                 view:(UIView *)view;

-(void)stopIndicatorInView:(UIView *)view;

-(void)stopIndicatorInViewController:(UIViewController *)viewController;

@end

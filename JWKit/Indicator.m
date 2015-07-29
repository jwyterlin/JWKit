//
//  Indicator.m
//  JWKit
//
//  Created by Jhonathan Wyterlin on 17/05/15.
//  Copyright (c) 2015 Jhonathan Wyterlin. All rights reserved.
//

#import "Indicator.h"
#import "MBProgressHUD.h"
#import "Validator.h"

@interface Indicator() {
    MBProgressHUD *HUD;
}

@end

@implementation Indicator

+(instancetype)shared {
    
    static Indicator *_shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shared = [Indicator new];
    });
    
    return _shared;
    
}

-(void)showIndicatorWithLabel:(NSString *)label viewController:(UIViewController *)viewController  {
    [self showIndicatorWithLabel:label delegate:viewController view:viewController.view];
}

-(void)showIndicatorWithLabel:(NSString *)label delegate:(id)delegate view:(UIView *)view {
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
    HUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    [[delegate class] conformsToProtocol:@protocol(MBProgressHUDDelegate)];
    
    HUD.delegate = delegate;
    
    if ( ! [Validator isEmptyString:label] )
        HUD.labelText = label;
    
}

-(void)showIndicatorDialogWithMessage:(NSString *)message viewController:(UIViewController *)viewController {
    [self showIndicatorDialogWithMessage:message delegate:viewController view:viewController.view];
}

-(void)showIndicatorDialogWithMessage:(NSString *)message delegate:(id)delegate view:(UIView *)view {
    
    HUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
    HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]];
    
    // Set custom view mode
    HUD.mode = MBProgressHUDModeCustomView;
    
    [[delegate class] conformsToProtocol:@protocol(MBProgressHUDDelegate)];
    
    HUD.delegate = delegate;
    HUD.labelText = message;
    
    [HUD show:YES];
    [HUD hide:YES afterDelay:1];
    
}

-(void)stopIndicatorInView:(UIView *)view {
    view.userInteractionEnabled = YES;
    [self stopIndicator];
}

-(void)stopIndicatorInViewController:(UIViewController *)viewController {
    
    viewController.navigationController.toolbar.userInteractionEnabled = YES;
    
    [self stopIndicator];
    
}

-(void)stopIndicator {
    
    [HUD hide:YES];
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    
}

@end

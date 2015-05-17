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

-(void)showIndicatorWithLabel:(NSString *)label viewController:(UIViewController *)viewController {
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
    HUD = [MBProgressHUD showHUDAddedTo:viewController.view animated:YES];
    
    [viewController.class conformsToProtocol:@protocol(MBProgressHUDDelegate)];
    
    HUD.delegate = viewController;
    
    if ( ! [Validator isEmptyString:label] )
        HUD.labelText = label;
    
}

-(void)showIndicatorDialogWithMessage:(NSString *)message viewController:(UIViewController *)viewController {
    
    HUD = [MBProgressHUD showHUDAddedTo:viewController.view animated:YES];
    HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]];
    
    // Set custom view mode
    HUD.mode = MBProgressHUDModeCustomView;
    
    [viewController.class conformsToProtocol:@protocol(MBProgressHUDDelegate)];
    
    HUD.delegate = viewController;
    HUD.labelText = message;
    
    [HUD show:YES];
    [HUD hide:YES afterDelay:1];
    
}

-(void)stopIndicatorInViewController:(UIViewController *)viewController {
    
    viewController.navigationController.toolbar.userInteractionEnabled = YES;
    
    [HUD hide:YES];
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    
}

@end

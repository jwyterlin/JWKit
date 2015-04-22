//
//  Alert.m
//  JWKit
//
//  Created by Jhonathan Wyterlin on 21/04/15.
//  Copyright (c) 2015 Jhonathan Wyterlin. All rights reserved.
//

#import "Alert.h"

@implementation Alert

-(UIAlertView *)showAlertMessage:(NSString *)message {
    
    return [self showAlertMessage:message delegate:nil];
    
}

-(UIAlertView *)showAlertMessage:(NSString *)message delegate:(id)delegate {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:message
                                                   delegate:delegate
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    
    return alert;
    
}

@end

//
//  Alert.h
//  JWKit
//
//  Created by Jhonathan Wyterlin on 21/04/15.
//  Copyright (c) 2015 Jhonathan Wyterlin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Alert : NSObject

-(UIAlertView *)showAlertMessage:(NSString *)message;
-(UIAlertView *)showAlertMessage:(NSString *)message delegate:(id)delegate;

@end

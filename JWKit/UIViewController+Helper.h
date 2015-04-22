//
//  UIViewController+Helper.h
//  JWKit
//
//  Created by Jhonathan Wyterlin on 21/04/15.
//  Copyright (c) 2015 Jhonathan Wyterlin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIViewController (Helper)

-(void)dismiss;
-(BOOL)isCalledModally;
-(void)registerObserversForKeyboard;
-(void)dismissKeyboard;

@end

//
//  UIViewController+Helper.m
//  JWKit
//
//  Created by Jhonathan Wyterlin on 21/04/15.
//  Copyright (c) 2015 Jhonathan Wyterlin. All rights reserved.
//

#import "UIViewController+Helper.h"

#import <objc/runtime.h>

@interface UIViewController()

@property(nonatomic,assign) UITapGestureRecognizer *tapToDismissKeyboard;

@end

static char kTapToDismissKeyboardKey;

@implementation UIViewController (Helper)

#pragma mark - Public methods

-(void)dismiss {
    
    if ( [self isCalledModally] )
        [self dismissViewControllerAnimated:YES completion:nil];
    else
        [[self navigationController] popViewControllerAnimated:YES];
    
}

-(BOOL)isCalledModally {
    return ( ! self.navigationController );
}

-(void)registerObserversForKeyboard {
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    
}

-(void)dismissKeyboard {
    [self.view endEditing:YES];
}

#pragma mark - Private methods

-(void)keyboardWasShown:(NSNotification*)aNotification {
    
    if ( ! self.tapToDismissKeyboard )
        [self setTapToDismissKeyboard: [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard:)]];
    
    [self.view addGestureRecognizer:self.tapToDismissKeyboard];
    
}

-(void)keyboardWillBeHidden:(NSNotification*)aNotification {
    [self.view removeGestureRecognizer:self.tapToDismissKeyboard];
}

-(void)dismissKeyboard:(UITapGestureRecognizer *)tap {
    [self.view endEditing:YES];
}

#pragma mark - Creating instances variables

// Property: tapToDismissKeyboard
-(void)setTapToDismissKeyboard:(UITapGestureRecognizer *)tapToDismissKeyboard {
    objc_setAssociatedObject(self, &kTapToDismissKeyboardKey, tapToDismissKeyboard, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UITapGestureRecognizer *)tapToDismissKeyboard {
    return objc_getAssociatedObject(self, &kTapToDismissKeyboardKey);
}

@end

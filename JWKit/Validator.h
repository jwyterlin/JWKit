//
//  Validator.h
//  JWKit
//
//  Created by Jhonathan Wyterlin on 2/13/15.
//  Copyright (c) 2015 Jhonathan Wyterlin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Validator : NSObject

typedef enum {
    ResultValidationEverythingOK = 0,
    ResultValidationFieldsListNull,
    ResultValidationFieldsListEmpty,
    ResultValidationAllFieldsRequired,
    ResultValidationInvalidEmail,
    ResultValidationPasswordHasNoMinimumLengthRequired
} ResultValidation;

+(BOOL)validateObject:(id)object;
+(BOOL)validateObjects:(NSArray *)objects;
+(BOOL)isEmptyString:(NSString *)string;
+(BOOL)isAllFilledStrings:(NSArray *)arrayStrings;
+(id)safeObject:(NSArray *)array atIndex:(NSUInteger)index;
+(BOOL)validateEmail:(NSString*)email;
+(BOOL)validatePasswordLength:(NSString *)password;
+(ResultValidation)validateFields:(NSArray *)fields;

@end

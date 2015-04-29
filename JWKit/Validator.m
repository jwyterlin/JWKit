//
//  Validator.m
//  JWKit
//
//  Created by Jhonathan Wyterlin on 2/13/15.
//  Copyright (c) 2015 Jhonathan Wyterlin. All rights reserved.
//

#import "Validator.h"

#import "FieldToValidate.h"
#import "StringHelper.h"

@implementation Validator

+(BOOL)validateObject:(id)object {
    
    if ( object == nil ) {
        return NO;
    }
    
    if ( [object isEqual:[NSNull null]] ) {
        return NO;
    }
    
    return YES;
    
}

+(BOOL)validateObjects:(NSArray *)objects {
    
    for ( int x = 0; x < objects.count; x++ ) {
        
        if ( ! [self validateObject:objects[x]] ) {
            return NO;
        }
        
    }
    
    return YES;
    
}

+(BOOL)isEmptyString:(NSString *)string {
    
    if ( string == nil )
        return YES;
    
    if ( [string isEqual:[NSNull null]] )
        return YES;
    
    if ( [string isKindOfClass:[NSNumber class]] )
        return [[NSString stringWithFormat:@"%lld", [string longLongValue]] isEqualToString:@""];
    
    return [string isEqualToString:@""];
    
}

+(BOOL)isAllFilledStrings:(NSArray *)arrayStrings {
    
    for ( register int x = 0; x < arrayStrings.count; x++ ) {
        
        if ( [Validator isEmptyString:arrayStrings[x]] ) {
            return NO;
        }
        
    }
    
    return YES;
    
}

+(id)safeObject:(NSArray *)array atIndex:(NSUInteger)index {
    
    if ( index >= array.count )
        return nil;
    
    return array[index];
    
}

+(BOOL)validateEmail:(NSString*)email {
    
    if ( ! email )
        return NO;
    
    if ( [email isEqualToString:@""] )
        return NO;
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    return [emailTest evaluateWithObject:email];
    
}

+(BOOL)validatePasswordLength:(NSString *)password {
    return ( password.length > 4 );
}

+(ResultValidation)validateFields:(NSArray *)fields {
    
    if ( ! fields )
        return ResultValidationFieldsListNull;
    
    if ( fields.count == 0 )
        return ResultValidationFieldsListEmpty;
    
    NSMutableArray *allFieldsValue = [NSMutableArray new];
    
    for ( FieldToValidate *field in fields ) {
        field.value = [StringHelper nilToString:field.value];
        [allFieldsValue addObject:field.value];
    }
    
    if ( ! [Validator isAllFilledStrings:allFieldsValue] )
        return ResultValidationAllFieldsRequired;
    
    for ( FieldToValidate *field in fields ) {
        
        if ( field.type == FieldToValidateTypeEmail )
            if ( ! [Validator validateEmail:field.value] )
                return ResultValidationInvalidEmail;
        
        if ( field.type == FieldToValidateTypePassword )
            if ( ! [Validator validatePasswordLength:field.value] )
                return ResultValidationPasswordHasNoMinimumLengthRequired;
        
    }
    
    return ResultValidationEverythingOK;
    
}

@end

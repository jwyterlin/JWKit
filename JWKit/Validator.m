//
//  Validator.m
//  JWKit
//
//  Created by Jhonathan Wyterlin on 2/13/15.
//  Copyright (c) 2015 Jhonathan Wyterlin. All rights reserved.
//

#import "Validator.h"

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

@end

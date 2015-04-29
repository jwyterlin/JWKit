//
//  FieldToValidate.m
//  JWKit
//
//  Created by Jhonathan Wyterlin on 28/04/15.
//  Copyright (c) 2015 Jhonathan Wyterlin. All rights reserved.
//

#import "FieldToValidate.h"

@implementation FieldToValidate

-(id)initWithValue:(NSString *)value type:(FieldToValidateType)type {
    
    self = [super init];
    
    if ( self ) {
        self.value = value;
        self.type = type;
    }
    
    return self;
    
}

@end

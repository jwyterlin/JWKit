//
//  FieldToValidate.h
//  JWKit
//
//  Created by Jhonathan Wyterlin on 28/04/15.
//  Copyright (c) 2015 Jhonathan Wyterlin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FieldToValidate : NSObject

typedef enum {
    FieldToValidateTypeEmail = 0,
    FieldToValidateTypePassword,
    FieldToValidateTypeOrdinaryString
} FieldToValidateType;

@property(nonatomic,strong) NSString *value;
@property(nonatomic) FieldToValidateType type;

-(id)initWithValue:(NSString *)value type:(FieldToValidateType)type;

@end

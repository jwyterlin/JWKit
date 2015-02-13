//
//  NSMutableArray+Helper.m
//  JWKit
//
//  Created by Jhonathan Wyterlin on 2/13/15.
//  Copyright (c) 2015 Jhonathan Wyterlin. All rights reserved.
//

#import "NSMutableArray+Helper.h"

@implementation NSMutableArray (Helper)

-(id)copyWithZone:(NSZone *)zone {
    
    NSMutableArray *copy = [[[self class] allocWithZone:zone] init];
    
    [copy addObjectsFromArray:[[self mutableCopy] allObjects]];
    
    return copy;
    
}

@end

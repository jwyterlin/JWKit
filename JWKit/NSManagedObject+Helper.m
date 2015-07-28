//
//  NSManagedObject+Helper.m
//  JWKit
//
//  Created by Jhonathan Wyterlin on 27/07/15.
//  Copyright (c) 2015 Jhonathan Wyterlin. All rights reserved.
//

#import "NSManagedObject+Helper.h"

@implementation NSManagedObject (Helper)

+(id)insertNewObjectInContext:(NSManagedObjectContext *)context {
    return [NSEntityDescription insertNewObjectForEntityForName:[self description] inManagedObjectContext:context];
}

@end

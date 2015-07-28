//
//  NSManagedObject+Helper.h
//  JWKit
//
//  Created by Jhonathan Wyterlin on 27/07/15.
//  Copyright (c) 2015 Jhonathan Wyterlin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface NSManagedObject (Helper)

+(id)insertNewObjectInContext:(NSManagedObjectContext *)context;

@end

//
//  Database.m
//  JWKit
//
//  Created by Jhonathan Wyterlin on 2/13/15.
//  Copyright (c) 2015 Jhonathan Wyterlin. All rights reserved.
//

#import "Database.h"

@implementation Database

static NSString *const kDbSqLite = @"AppNameDB.sqlite";
static NSString *const kDbName = @"AppNameDB";
static NSString *const kXcodeDataModel = @"ModelName"; // This is the name of file 'ModelName.momd'
static NSString *const kXcodeDataModelExtension = @"momd";
static NSString *const kSqLiteExtension = @"sqlite";

@synthesize managedObjectContext = __managedObjectContext;
@synthesize managedObjectModel = __managedObjectModel;
@synthesize persistentStoreCoordinator = __persistentStoreCoordinator;

+(instancetype)sharedInstance {
    
    static Database *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate, ^{
        
        _sharedInstance = [Database new];
        
    });
    
    return _sharedInstance;
    
}

+(void)saveContext {
    
    [[Database sharedInstance] saveContext];
    
}

-(void)saveContext {
    
    NSError *error = nil;
    
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    
    if ( managedObjectContext != nil ) {
        
        if ( [managedObjectContext hasChanges] && ! [managedObjectContext save:&error] ) {
            
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog( @"Unresolved error %@, %@", error, [error userInfo] );
            
            //abort();
            
        }
        
    }
    
}

#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
-(NSManagedObjectContext *)managedObjectContext {
    
    if ( __managedObjectContext != nil ) {
        
        return __managedObjectContext;
        
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    
    if ( coordinator != nil ) {
        
        __managedObjectContext = [NSManagedObjectContext new];
        
        [__managedObjectContext setPersistentStoreCoordinator:coordinator];
        
    }
    
    return __managedObjectContext;
    
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
-(NSManagedObjectModel *)managedObjectModel {
    
    if ( __managedObjectModel != nil ) {
        return __managedObjectModel;
    }
    
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:kXcodeDataModel withExtension:kXcodeDataModelExtension];
    
    __managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    
    return __managedObjectModel;
    
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    
    if ( __persistentStoreCoordinator != nil ) {
        
        return __persistentStoreCoordinator;
        
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:kDbSqLite];
    
    if ( ! [[NSFileManager defaultManager] fileExistsAtPath:[storeURL path]] ) {
        
        /*NSURL *preloadURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:kDbName ofType:kSqLiteExtension]];
         
         NSError* err = nil;
         
         if ( ! [[NSFileManager defaultManager] copyItemAtURL:preloadURL toURL:storeURL error:&err] ) {
         
         NSLog( @"Oops, could copy preloaded data" );
         
         }*/
        
        //NSLog( @"%@ doesn't exist", kDbSqLite );
        
    } else {
        //NSLog( @"%@ exists", kDbSqLite );
    }
    
    NSError *error = nil;
    
    __persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    
    NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:
                             [NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption,
                             [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
    
    if ( ! [__persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:options error:&error] ) {
        
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
         [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption, [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        
        NSLog( @"Unresolved error %@, %@", error, [error userInfo] );
        
        //abort();
        
    }
    
    return __persistentStoreCoordinator;
    
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory {
    
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    
}

+(void)saveEntity {
    
    [[Database sharedInstance] saveEntity];
    
    [[Database sharedInstance] saveContext];
    
}

-(void)saveEntity {
    
    NSManagedObjectContext *context = [self managedObjectContext];
    
    NSError *error;
    
    if ( ! [context save:&error] ) {
        NSLog( @"Whoops, couldn't save: %@", [error localizedDescription] );
    } else {
        NSLog( @"Entity saved." );
    }
    
}

+(void)flushDatabase {
    [[Database sharedInstance] flushDatabase];
}

-(void) flushDatabase {
    
    [__managedObjectContext lock];
    NSArray *stores = [__persistentStoreCoordinator persistentStores];
    for(NSPersistentStore *store in stores) {
        [__persistentStoreCoordinator removePersistentStore:store error:nil];
        [[NSFileManager defaultManager] removeItemAtPath:store.URL.path error:nil];
    }
    [__managedObjectContext unlock];
    __managedObjectModel    = nil;
    __managedObjectContext  = nil;
    __persistentStoreCoordinator = nil;
}

@end

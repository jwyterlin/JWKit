//
//  BinarySearchTree.h
//  Booklet
//
//  Created by Jhonathan Wyterlin on 2/12/15.
//  Copyright (c) 2015 Jhonathan Wyterlin. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Node.h"

@interface BinarySearchTree : NSObject

-(id)init;
-(Node *)searchWithTree:(Node *)root value:(id)value;
-(void)insertWithNode:(Node *)node value:(id)value;
-(void)insertValue:(id)value;
-(void)removeWithNode:(Node *)node parentNode:(Node *)parentNode value:(id)value;
-(void)removeWithValue:(id)value;
-(NSString *)stringOfSubTreeIn:(Node *)node;

@end

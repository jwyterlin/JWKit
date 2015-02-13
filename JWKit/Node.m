//
//  Tree.m
//  Booklet
//
//  Created by Jhonathan Wyterlin on 2/12/15.
//  Copyright (c) 2015 Jhonathan Wyterlin. All rights reserved.
//

#import "Node.h"

@implementation Node

-(id)init {
    
    self = [super init];
    
    if ( ! self )
        return nil;
    
    return self;
    
}

-(id)initWithValue:(id)value {
    
    self = [super init];
    
    if ( ! self )
        return nil;
    
    self.value = value;
    
    return self;
    
}

-(id)initWithValue:(id)value nodeRight:(Node *)right nodeLeft:(Node *)left {
    
    self = [super init];
    
    if ( ! self )
        return nil;
    
    self.value = value;
    self.right = right;
    self.left = left;
    
    return self;
    
}

-(Node *)successor:(Node *)node {
    Node *successor = node;
    successor = successor.right;
    while (successor.left) {
        successor = successor.left;
    }
    return successor;
}

-(Node *)predecessor:(Node *)node {
    Node *predecessor = node;
    predecessor = predecessor.left;
    while (predecessor.right) {
        predecessor = predecessor.right;
    }
    return predecessor;
}

-(NSString *)description {
    return [NSString stringWithFormat:@"%@",[self.value description]];
}

@end

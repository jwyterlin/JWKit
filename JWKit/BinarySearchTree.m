//
//  BinarySearchTree.m
//  Booklet
//
//  Created by Jhonathan Wyterlin on 2/12/15.
//  Copyright (c) 2015 Jhonathan Wyterlin. All rights reserved.
//

#import "BinarySearchTree.h"

@interface BinarySearchTree()

@property(nonatomic,strong) Node *root;

@end

@implementation BinarySearchTree

-(id)init {
    
    self = [super init];
    
    if ( ! self )
        return nil;
    
    self.root = nil;
    
    return self;
    
}

-(Node *)searchWithTree:(Node *)root value:(id)value {
    
    if ( ! root || [root.value isEqual:value] )
        return root;
    
    if ( root.value > value )
        return [self searchWithTree:root.left value:value];
    else
        return [self searchWithTree:root.right value:value];
    
}

-(void)insertWithNode:(Node *)node value:(id)value {
    
    if ( [node.value isEqual:value] ) {
        // Node with this value already exists
        return;
    } else if ( ! node ) {
        node.value = value;
    } else {
        if ( value < node.value ) {
            if ( ! node.left ) {
                Node *newNode = [Node new];
                newNode.value = value;
                node.left = newNode;
            } else {
                [self insertWithNode:node.left value:value];
            }
        } else {
            if ( ! node.right ) {
                Node *newNode = [Node new];
                newNode.value = value;
                node.right = newNode;
            } else {
                [self insertWithNode:node.right value:value];
            }
        }
    }
    
}

-(void)insertValue:(id)value {
    
    if ( ! self.root ) {
        self.root = [Node new];
        self.root.value = value;
    } else {
        [self insertWithNode:self.root value:value];
    }
    
}

-(void)removeWithNode:(Node *)node parentNode:(Node *)parentNode value:(id)value {
    
    if ( ! [node.value isEqual:value] ) {
        if ( value < node.value ) {
            if ( node.left ) {
                [self removeWithNode:node.left parentNode:node value:value];
            } else {
                // This value is not in the tree
            }
        } else {
            if ( node.right ) {
                [self removeWithNode:node.right parentNode:node value:value];
            } else {
                // This value is not in the tree
            }
        }
    } else {
        if ( ( ! node.right ) && ( ! node.left ) ) {
            if ( parentNode.right == node ) {
                parentNode.right = nil;
            } else {
                parentNode.left = nil;
            }
        } else if ( ( ! node.right ) || ( ! node.left ) ) {
            if ( node.left ) {
                if ( node == self.root ) {
                    self.root = node.left;
                } else {
                    if ( node.left ) {
                        parentNode.right = node.left;
                    } else {
                        parentNode.right = node.right;
                    }
                }
            } else {
                if ( node == self.root ) {
                    self.root = node.right;
                } else {
                    if ( node.right ) {
                        parentNode.right = node.right;
                    } else {
                        parentNode.right = node.left;
                    }
                }
            }
        } else {
            Node *nodeHelper;
            nodeHelper = [node successor:node];
            node.value = nodeHelper.value;
            [self removeWithNode:node.right parentNode:node value:nodeHelper.value];
        }
    }
    
}

-(void)removeWithValue:(id)value {
    
    if ( ! self.root ) {
        return;
    } else if ( ( self.root.value == value ) && ( ! self.root.left ) && ( ! self.root.right ) ) {
        self.root = nil;
    } else {
        [self removeWithNode:self.root parentNode:self.root value:value];
    }
    
}

-(NSString *)stringOfSubTreeIn:(Node *)node {
    
    NSString *stringToReturn;
    
    if ( ! node ) {
        return @" ";
    }
    
    stringToReturn = @"";
    stringToReturn = [NSString stringWithFormat:@"%@%@",stringToReturn, [self stringOfSubTreeIn:node.left]];
    stringToReturn = [NSString stringWithFormat:@"%@%@",stringToReturn,node.description];
    stringToReturn = [NSString stringWithFormat:@"%@%@",stringToReturn, [self stringOfSubTreeIn:node.right]];
    
    return stringToReturn;
    
}

-(NSString *)description {
    return [self stringOfSubTreeIn:self.root];
}

@end

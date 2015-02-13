//
//  Node.h
//  Booklet
//
//  Created by Jhonathan Wyterlin on 2/12/15.
//  Copyright (c) 2015 Jhonathan Wyterlin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject

@property(nonatomic,strong) id value;
@property(nonatomic,strong) Node *left;
@property(nonatomic,strong) Node *right;

-(id)init;
-(id)initWithValue:(id)value;
-(id)initWithValue:(id)value nodeRight:(Node *)right nodeLeft:(Node *)left;
-(Node *)successor:(Node *)node;
-(Node *)predecessor:(Node *)node;

@end

//
//  UITableView+Helper.h
//  JWKit
//
//  Created by Jhonathan Wyterlin on 26/07/15.
//  Copyright (c) 2015 Jhonathan Wyterlin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UITableView (Helper)

-(void)registerNibForCellReuseIdentifier:(NSString *)identifier;
-(void)registerNibsForCellReuseIdentifiers:(NSArray *)identifiers;
-(void)cleanTableFooter;
-(void)removeSeparator;

@end

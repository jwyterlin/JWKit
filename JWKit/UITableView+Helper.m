//
//  UITableView+Helper.m
//  JWKit
//
//  Created by Jhonathan Wyterlin on 26/07/15.
//  Copyright (c) 2015 Jhonathan Wyterlin. All rights reserved.
//

#import "UITableView+Helper.h"

@implementation UITableView (Helper)

-(void)registerNibForCellReuseIdentifier:(NSString *)identifier {
    
    UINib *nib = [UINib nibWithNibName:identifier bundle:nil];
    [self registerNib:nib forCellReuseIdentifier:identifier];
    
}

-(void)registerNibsForCellReuseIdentifiers:(NSArray *)identifiers {
    
    if ( ! identifiers )
        return;
    
    for ( NSString *identifier in identifiers ) {
        UINib *nib = [UINib nibWithNibName:identifier bundle:nil];
        [self registerNib:nib forCellReuseIdentifier:identifier];
    }
    
}

-(void)cleanTableFooter {
    self.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

-(void)removeSeparator {
    self.separatorColor = [UIColor clearColor];
}

@end

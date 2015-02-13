//
//  CellHelper.m
//  JWKit
//
//  Created by Jhonathan Wyterlin on 2/13/15.
//  Copyright (c) 2015 Jhonathan Wyterlin. All rights reserved.
//

#import "CellHelper.h"

@implementation CellHelper

@synthesize delegate = _delegate;

-(CGFloat)calculateHeightForConfiguredSizingCell:(UITableViewCell *)sizingCell {
    
    [sizingCell setNeedsLayout];
    [sizingCell layoutIfNeeded];
    
    CGSize size = [sizingCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    
    return size.height;
    
}

-(CGFloat)heightForCellAtIndexPath:(NSIndexPath *)indexPath
                         tableView:(UITableView *)tableView
                    cellIdentifier:(NSString *)cellIdentifier
                          delegate:(id)__delegate {
    
    self.delegate = __delegate;
    
    UITableViewCell *sizingCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    SEL aSelector = NSSelectorFromString(@"configureCell:tableView:atIndexPath:");
    
    if ( [self.delegate respondsToSelector:aSelector] ) {
        
        NSInvocation *inv = [NSInvocation invocationWithMethodSignature:[__delegate methodSignatureForSelector:aSelector]];
        [inv setSelector:aSelector];
        [inv setTarget:self.delegate];
        
        //arguments 0 and 1 are self and _cmd respectively, automatically set by NSInvocation
        [inv setArgument:&(sizingCell) atIndex:2];
        [inv setArgument:&(tableView) atIndex:3];
        [inv setArgument:&(indexPath) atIndex:4];
        
        [inv invoke];
        
    }
    
    return [self calculateHeightForConfiguredSizingCell:sizingCell];
    
}

@end
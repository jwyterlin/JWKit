//
//  CellHelper.h
//  JWKit
//
//  Created by Jhonathan Wyterlin on 2/13/15.
//  Copyright (c) 2015 Jhonathan Wyterlin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol CellHelperDelegate;


@interface CellHelper : NSObject {
    id <CellHelperDelegate> delegate;
}

@property (nonatomic,strong) id <CellHelperDelegate> delegate;

-(CGFloat)calculateHeightForConfiguredSizingCell:(UITableViewCell *)sizingCell;

-(CGFloat)heightForCellAtIndexPath:(NSIndexPath *)indexPath
                         tableView:(UITableView *)tableView
                    cellIdentifier:(NSString *)cellIdentifier
                          delegate:(id)__delegate;

@end

@protocol CellHelperDelegate <NSObject>

@required

-(void)configureCell:(UITableViewCell *)cell tableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath;

@end


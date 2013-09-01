//
//  AccountsViewController.h
//  TwitterAssignment
//
//  Created by Luc Le Quiniat on 1/09/13.
//  Copyright (c) 2013 Luc Le Quiniat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FollowedCell.h"
#import "TrackData.h"

@interface AccountsViewController : UITableViewController
{
    TrackData *tracking;
}

@property (nonatomic, strong) NSArray *followedName;

@end

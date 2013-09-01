//
//  TMBAccount.m
//  TumblrManager
//
//  Created by Andie Le Quiniat on 24/08/13.
//  Copyright (c) 2013 Andie Le Quiniat. All rights reserved.
//

#import "Account.h"

@implementation Account


-(id) initWithDetails: (NSString *)passedAccountID
{
    if ((self = [super init])) {
        _accountID = passedAccountID;
        
//        int randomTestNumber = (arc4random() % 5) + 1;

    }
    return self;
}


- (NSString *) displayUserName {
    _accountName = @"Getting There";
    return _accountName;
}

@end

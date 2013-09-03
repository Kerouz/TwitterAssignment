//
//  TMBAccount.h
//  TumblrManager
//
//  Created by Andie Le Quiniat on 24/08/13.
//  Copyright (c) 2013 Andie Le Quiniat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Accounts/Accounts.h>
#import <Social/Social.h>


@interface Account : NSObject
{
    
}

@property (nonatomic, strong) NSString *accountID;
@property (nonatomic, strong) NSString *accountName;
@property (nonatomic, strong) UIImage *accountImage;
@property (nonatomic, strong) NSArray *datasource;
@property (nonatomic, strong) NSArray *accountDetail;



-(id) initWithDetails: (NSString *)passedAccountID;
-(NSString *) displayUserName;
-(NSString *) getAccountDetails:(NSInteger *)userID;

@end

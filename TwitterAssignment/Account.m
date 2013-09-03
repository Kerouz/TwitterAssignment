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


- (NSString *) getAccountDetails:(NSInteger *)userID {
    ACAccountStore *account = [[ACAccountStore alloc] init];
    ACAccountType *accountType = [account accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
    
    [account requestAccessToAccountsWithType:accountType options:nil completion:^(BOOL granted, NSError *error)
     {
         if (granted)
         {
             NSArray *arrayOfAccounts = [account accountsWithAccountType:accountType];
             
             if ([arrayOfAccounts count] > 0)
             {
                 ACAccount *twitterAccount = [arrayOfAccounts lastObject];
                 
                 NSString *user = [NSString stringWithFormat:@"%d", (int)userID];
                 NSString *url = @"https://api.twitter.com/1.1/users/show.json?user_id=";
                 url = [url stringByAppendingString:user];
                 
                 NSURL *requestURL = [NSURL URLWithString:url];
                 NSMutableDictionary *twitterParameters = [[NSMutableDictionary alloc] init];
                 
//                 [twitterParameters setObject:@"5" forKey:@"count"];
                 [twitterParameters setObject:@"1" forKey:@"include_entities"];
                 
                 SLRequest *postRequest = [SLRequest
                                           requestForServiceType:SLServiceTypeTwitter
                                           requestMethod:SLRequestMethodGET
                                           URL:requestURL
                                           parameters:twitterParameters];
                 
                 postRequest.account = twitterAccount;
                 
                 [postRequest performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error)
                  {
                      _datasource = [NSJSONSerialization JSONObjectWithData:responseData
                                                                    options:NSJSONReadingMutableLeaves
                                                                      error:&error];
                      
                      if(_datasource)
                      {
                          _accountName = [_datasource valueForKey:@"name"];
                          NSLog(@"Returned name: %@", _accountName);
                          NSLog(@"Returned data: %@", _datasource);

                      }
                      
                      if (_datasource.count != 0) {
                          dispatch_async(dispatch_get_main_queue(), ^
                                         {
                                             //      [self.tableView reloadData];
                                         });
                      }
                      
                  }];
                 
              
             }

             //        } else {
             // HANDLE FAILURE TO GET ACCOUNT ACCESS
         }

     }];
    return _accountName;
}



@end

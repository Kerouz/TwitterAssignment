//
//  Created by Jesse Collis on 12/08/13.
//  Copyright (c) 2013 RMIT. All rights reserved.
//

#import "TrackData.h"
//#import "RMITVenue.h"

@interface TrackData()
@property (nonatomic, strong, readwrite) NSArray *followedUserArray;
@end


@implementation TrackData

- (id)init
{
    if (self = [super init])
    {
//         these values may change, saving them in the FourSquareDemo-Info.plist is a good way to store values
//         without having them in code.
//         [NSBundle mainBundle] objectForInfoDictionaryKey: is a very good way to get the values stored in the
//         info.plist file of an app.

//        self.fourSquareClientID = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"RMITFoursquareClientID"];
//        self.fourSquareAppSecret = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"RMITFoursquareSecret"];
    }
    return self;
}


- (void) getFollowed {
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
                 
                 NSURL *requestURL = [NSURL URLWithString:@"https://api.twitter.com/1.1/friends/ids.json"];
                 NSMutableDictionary *twitterParameters = [[NSMutableDictionary alloc] init];
                 
                 [twitterParameters setObject:@"5" forKey:@"count"];
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
                          _results = [_datasource valueForKey:@"ids"];
                          NSLog(@"Results from AppDelegate: %@", _results);
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
}


#pragma mark - Private Failure Methods

- (void)handleNetworkError:(NSError *)error
{
//    self.venues = nil;
//
//    if ([self.delegate respondsToSelector:@selector(repository:didFailToLoadVenuesWithTerm:)])
//    {
//        [self.delegate repository:self didFailToLoadVenuesWithTerm:self.term];
//    }
}

#pragma mark - Private Success Methods

- (void)handleNetworkResponse:(NSData *)data
{
    NSError *error;
    id JSONResponse = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];

    if (error)
    {
        [self handleNetworkErorr:error];
        return;
    }

    id responseArray = [JSONResponse valueForKeyPath:@"response.groups"][0][@"items"];

    NSMutableArray *venues = [[NSMutableArray alloc] initWithCapacity:[responseArray count]];
    for (id venueDict in responseArray)
    {
//        RMITVenue *venue = [[RMITVenue alloc] initWithAPIResponse:venueDict];
//        [venues addObject:venue];
//    }
//
//    self.venues = venues;
//
//    if ([self.delegate respondsToSelector:@selector(repository:didLoadVenues:)])
//    {
//        [self.delegate repository:self didLoadVenues:self.venues];
    }
}



@end

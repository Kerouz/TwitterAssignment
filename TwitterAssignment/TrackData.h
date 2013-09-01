//
//  Created by Luc Le Quiniat on 12/08/13.
//

#import <Accounts/Accounts.h>
#import <Social/Social.h>


@interface TrackData : NSObject

//@property (nonatomic, strong, readonly) NSString *fourSquareClientID;
//@property (nonatomic, strong, readonly) NSString *fourSquareAppSecret;

@property (nonatomic, strong) NSString *term;
@property (nonatomic, strong, readonly) NSArray *accounts;
@property (nonatomic, strong) NSArray *datasource;
@property (nonatomic, strong) NSArray *results;

- (void)getFollowed;

- (void)handleNetworkErorr:(NSError *)error;

@end

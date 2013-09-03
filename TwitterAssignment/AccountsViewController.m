//
//  AccountsViewController.m
//  TwitterAssignment
//
//  Created by Luc Le Quiniat on 1/09/13.
//  Copyright (c) 2013 Luc Le Quiniat. All rights reserved.
//

#import "AccountsViewController.h"
#import "TrackData.h"
#import "Account.h"

@interface AccountsViewController ()

@end

@implementation AccountsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    tracking = [[TrackData alloc]init];
    [tracking getFollowed];
    
    NSLog(@"tracking output: %@", tracking.results);

//    _followedName = tracking.results;
    
    _followedName = @[@"User 1",
                      @"User 2",
                      @"User 3",
                      @"User 4"];
    

    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(refreshFollowed) forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refreshControl;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)refreshFollowed
{
//    self.isAscending = !self.isAscending;
//    NSSortDescriptor* sortOrder = [NSSortDescriptor sortDescriptorWithKey: @"self"
//                                                                ascending:self.isAscending];
//    NSArray *sortedArray = [self.letterData sortedArrayUsingDescriptors:
//                            [NSArray arrayWithObject: sortOrder]];
//    NSUInteger index = 0;
//    for (NSString *s in sortedArray)
//    {
//        self.letterData[index] = s;
//        index++;
//    }
    
    NSLog(@"Refresh tracking output: %@", tracking.results);

    [self.tableView reloadData];
    [self.refreshControl endRefreshing];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"Tracking Results count: %lu", (unsigned long)tracking.results.count);
    return tracking.results.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"FollowedTableCell";
    FollowedCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Get the current user ID for the cell
    // Get the matching name from Twitter
    
    Account *getAccount = [[Account alloc] init];
    NSInteger accountNumber = [[tracking.results objectAtIndex:[indexPath row]] integerValue];
    
//    [getAccount getAccountDetails:accountNumber];
    NSString *currentName = [getAccount getAccountDetails:&accountNumber];
    
//    cell.followedUserCell.text = [NSString stringWithFormat:@"%@",[tracking.results objectAtIndex:[indexPath row]]];
    cell.followedUserCell.text = currentName;

    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end

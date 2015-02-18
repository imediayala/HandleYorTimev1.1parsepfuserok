//
//  TimelineTableViewController.m
//  HandleYorTimev1.1
//
//  Created by Daniel on 03/02/15.
//  Copyright (c) 2015 idesigndreams. All rights reserved.
//

#import "TimelineTableViewController.h"
#import <Parse/Parse.h>



@interface TimelineTableViewController ()

@end

@implementation TimelineTableViewController


@synthesize groundTable;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self performSelector:@selector(retrieveFromParse)];
}

- (void) retrieveFromParse {
    
    PFQuery *retrievegrounds = [PFQuery queryWithClassName:@"Grounds"];
   
    
    
    //Comments order
    
//    PFQuery *query = [PFQuery queryWithClassName:@"Grounds"];
//    //2
//    [query orderByDescending:@"createdAt"];
//    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
//        //3
//        if (!error) {
//            //Everything was correct, put the new objects and load the wall
//            self.groundTable = nil;
//            self.groundTable = [[NSArray alloc] initWithArray:objects];
//            [self retrieveFromParse];
//            
//        } else {
//            
//            //4
//            NSString *errorString = [[error userInfo] objectForKey:@"error"];
//            UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:errorString delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//            [errorAlertView show];
//        }
//    }];
    

    
    //Add the info label (User and creation date)
//   - NSDate *creationDate = creationDate.cellDate;
//    NSDateFormatter *df = [[NSDateFormatter alloc] init];
//    [df setDateFormat:@"HH:mm dd/MM yyyy"];
//    
    [retrievegrounds findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            groundsArray = [[NSArray alloc] initWithArray:objects];
        }
        [groundTable reloadData];
    }];
}





//*********************Setup table of folder names ************************

//get number of sections in tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

//get number of rows by counting number of folders
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return groundsArray.count;
}

//setup cells in tableView
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //setup cell
    static NSString *CellIdentifier = @"commentCell";
    GroundTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    PFObject *tempObject = [groundsArray objectAtIndex:indexPath.row];
    
    cell.cellTitle.text = [tempObject objectForKey:@"comment"];
    cell.cellUser.text = [tempObject objectForKey:@"user"];
    cell.cellDate.text = [tempObject objectForKey:@"createdAt"];
    
    return cell;
}


//user selects folder to add tag to
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"cell tapped");
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//#pragma mark - UIViewController
////
//
//    // Uncomment the following line to preserve selection between presentations.
//    // self.clearsSelectionOnViewWillAppear = NO;
//    
//    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
////}
//
//- (void)viewDidUnload {
//    [super viewDidUnload];
//    // Release any retained subviews of the main view.
//    // e.g. self.myOutlet = nil;
//}
//
//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//}
//
//- (void)viewDidAppear:(BOOL)animated {
//    [super viewDidAppear:animated];
//}
//
//- (void)viewWillDisappear:(BOOL)animated {
//    [super viewWillDisappear:animated];
//}
//
//- (void)viewDidDisappear:(BOOL)animated {
//    [super viewDidDisappear:animated];
//}
//
//
//
///*
// // Override to customize what kind of query to perform on the class. The default is to query for
// // all objects ordered by createdAt descending.
// - (PFQuery *)queryForTable {
// PFQuery *query = [PFQuery queryWithClassName:self.className];
// 
// // If Pull To Refresh is enabled, query against the network by default.
// if (self.pullToRefreshEnabled) {
// query.cachePolicy = kPFCachePolicyNetworkOnly;
// }
// 
// // If no objects are loaded in memory, we look to the cache first to fill the table
// // and then subsequently do a query against the network.
// if (self.objects.count == 0) {
// query.cachePolicy = kPFCachePolicyCacheThenNetwork;
// }
// 
// [query orderByDescending:@"createdAt"];
// 
// return query;
// }
// */
//
//
////  Override to customize the look of a cell representing an object. The default is to display
////  a UITableViewCellStyleDefault style cell with the label being the textKey in the object,
////  and the imageView being the imageKey in the object.
//// - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object {
//// static NSString *CellIdentifier = @"Cell";
//// 
//// PFTableViewCell *cell = (PFTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//// if (cell == nil) {
//// cell = [[PFTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//// }
//// 
////  Configure the cell
//// cell.textLabel.text = [object objectForKey:self.textKey];
//// cell.imageView.file = [object objectForKey:self.imageKey];
//// 
//// return cell;
//// }
//
//
///*
// // Override if you need to change the ordering of objects in the table.
// - (PFObject *)objectAtIndex:(NSIndexPath *)indexPath {
// return [self.objects objectAtIndex:indexPath.row];
// }
// */
//
///*
// // Override to customize the look of the cell that allows the user to load the next page of objects.
// // The default implementation is a UITableViewCellStyleDefault cell with simple labels.
// - (UITableViewCell *)tableView:(UITableView *)tableView cellForNextPageAtIndexPath:(NSIndexPath *)indexPath {
// static NSString *CellIdentifier = @"NextPage";
// 
// UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
// 
// if (cell == nil) {
// cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
// }
// 
// cell.selectionStyle = UITableViewCellSelectionStyleNone;
// cell.textLabel.text = @"Load more...";
// 
// return cell;
// }
// */
//
//#pragma mark - UITableViewDataSource
//
///*
// // Override to support conditional editing of the table view.
// - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
// // Return NO if you do not want the specified item to be editable.
// return YES;
// }
// */
//
///*
// // Override to support editing the table view.
// - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
// if (editingStyle == UITableViewCellEditingStyleDelete) {
// // Delete the object from Parse and reload the table view
// } else if (editingStyle == UITableViewCellEditingStyleInsert) {
// // Create a new instance of the appropriate class, and save it to Parse
// }
// }
// */
//
///*
// // Override to support rearranging the table view.
// - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
// }
// */
//
///*
// // Override to support conditional rearranging of the table view.
// - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
// // Return NO if you do not want the item to be re-orderable.
// return YES;
// }
// */
//
//#pragma mark - UITableViewDelegate
//
////- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
////    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
////}

@end
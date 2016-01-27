//
//  DetailViewController.m
//  HandleYorTimev1.1
//
//  Created by Daniel on 02/04/15.
//  Copyright (c) 2015 idesigndreams. All rights reserved.
//

#import "DetailViewController.h"
#import <Parse/Parse.h>
#import "GroundTableViewCell.h"
#import "TimelineTableViewController.h"




@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize groUnds;
@synthesize TextField;
@synthesize UserDetail;
@synthesize detailTableView;






- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //set tableview background image
    
    self.detailTableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Rectangle91b"]];
    
    
    PFUser *currentUser = [PFUser currentUser];
    if (currentUser) {
        // do stuff with the user
    } else {
        // show the signup or login screen
    }
    
    
    // Do any additional setup after loading the view.
   
       [self performSelector:@selector(retrieveFromParse)];
    
    // Set the Label text with the selected detail.
    
       self.TextField.text = [self.groUnds objectForKey:@"comment"];
     self.UserDetail.text = [self.groUnds objectForKey:@"user"];
    
}


- (void) retrieveFromParse {
    
    
    PFQuery *retrieveReplies = [PFQuery queryWithClassName:@"Replies"];
     [retrieveReplies whereKey:@"comment" equalTo:groUnds];
    
    
    
    
    [retrieveReplies orderByDescending:@"createdAt"];
    
    
    [retrieveReplies findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            repliesArray = [[NSArray alloc] initWithArray:objects];
        }
        [detailTableView reloadData];
    }];
}





//- (PFQuery *)queryForTable {
//    PFQuery *query = [PFQuery queryWithClassName:self.parseClassName];
//    
//    [self performSelector:@selector(retrieveFromParse)];
//    
//    
//    // If no objects are loaded in memory, we look to the cache first to fill the table
//    // and then subsequently do a query against the network.
//    
//    
//    //    if (self.objects.count == 0)
//    
//    
//    //    {
//    //        query.cachePolicy = kPFCachePolicyCacheThenNetwork;
//    //    }
//    
//    
//    
//    return query;
//}



//*********************Setup table of folder names ************************

//get number of sections in tableview

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

//get number of rows by counting number of folders

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return repliesArray.count;
}

//setup cells in tableView

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //Set Up cell
    static NSString *CellIdentifier = @"replyCell";
    GroundTableViewCell*cell =[tableView dequeueReusableCellWithIdentifier: CellIdentifier];
    
    PFObject *tempObject = [repliesArray objectAtIndex:indexPath.row];
    NSDate *created = [tempObject createdAt];
    
    //convert string to date object
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    
    [dateFormat setDateFormat:@"EEE, MMM d, h:mm a"];
    
    cell.cellDate.text = [NSString stringWithFormat:@"%@" ,
                          [dateFormat stringFromDate:created]];
    
    
    
    cell.cellTitle.text = [tempObject objectForKey:@"commentReplies"];
    cell.cellUser.text = [tempObject  objectForKey:@"user"];

    
    return cell;

}


    
    



//-(void)RetrieveObjectsFromParse {
//    PFQuery * GetObjects = [PFQuery queryWithClassName:@"Replies"];
//    
//    [GetObjects findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
//        if(!error) {
//            repliesArray =[[NSArray alloc] initWithArray: objects];
//        };
//        NSLog(@"groundsArray=%@", groUnds);
//        
//       
//    }];
//    
//}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




 //reply button

- (IBAction)sendReply:(id)sender {
    
    
    
    //1
    //Add the image to the object, and add the comment and the user
    PFObject *Reply = [PFObject objectWithClassName:@"Replies"];
    
    [Reply setObject:self.replyTextView.text forKey:@"commentReplies"];
    [Reply setObject:[PFUser currentUser] forKey:@"author"];
    [Reply setObject:groUnds forKey:@"comment"];
     [Reply setObject:[PFUser currentUser].username forKey:@"user"];
  
    //2
    [Reply saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        //3
        if (succeeded){
            //Go back to the wall
            [self.navigationController popViewControllerAnimated:YES];
        }
        else{
            NSString *errorString = [[error userInfo] objectForKey:@"error"];
            UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:errorString delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [errorAlertView show];
        }
    }];
}



@end

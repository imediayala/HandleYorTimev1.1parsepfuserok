//
//  TimelineTableViewController.h
//  HandleYorTimev1.1
//
//  Created by Daniel on 03/02/15.
//  Copyright (c) 2015 idesigndreams. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <ParseUI/ParseUI.h>
#import "GroundTableViewCell.h"
#import "DetailViewController.h"



@interface TimelineTableViewController : PFQueryTableViewController
<UITableViewDelegate, NSObject > {
    
    
    NSArray *groundsArray;
   
 
}



@property (strong, nonatomic) IBOutlet UITableView *groundTable;

@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) PFObject *object;


- (IBAction)commentButton:(id)sender;


    

@end

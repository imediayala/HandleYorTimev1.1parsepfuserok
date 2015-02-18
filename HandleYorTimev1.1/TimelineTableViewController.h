//
//  TimelineTableViewController.h
//  HandleYorTimev1.1
//
//  Created by Daniel on 03/02/15.
//  Copyright (c) 2015 idesigndreams. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import"GroundTableViewCell.h"

@interface TimelineTableViewController : UITableViewController
<UITableViewDelegate> {
    
    NSArray *groundsArray;
}
@property (strong, nonatomic) IBOutlet UITableView *groundTable;

@end

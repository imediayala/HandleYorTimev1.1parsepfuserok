//
//  DetailViewController.h
//  HandleYorTimev1.1
//
//  Created by Daniel on 02/04/15.
//  Copyright (c) 2015 idesigndreams. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <ParseUI/ParseUI.h>
#import "GroundTableViewCell.h"
#import "TimelineTableViewController.h"


@interface DetailViewController : UIViewController<
UITableViewDataSource,
UITableViewDelegate,
NSObject>
{
    

      
    
    NSArray *repliesArray;
    
}

@property (strong, nonatomic) IBOutlet UITableView *detailTableView;


@property (strong, nonatomic) IBOutlet UITextView *TextField;

@property (strong, nonatomic) IBOutlet UILabel *UserDetail;


@property (nonatomic, strong) PFObject *groUnds;


@property (strong, nonatomic) IBOutlet UITextField *replyTextView;
- (IBAction)sendReply:(id)sender;


@end

//
//  ComposeViewController.h
//  HandleYorTimev1.1
//
//  Created by Daniel on 03/02/15.
//  Copyright (c) 2015 idesigndreams. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>


@interface ComposeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *groundTextView;
@property (weak, nonatomic) IBOutlet UILabel *charRemaningLabel;
- (IBAction)sendGround:(id)sender;

@end

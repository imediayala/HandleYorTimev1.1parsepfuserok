//
//  EditProfileViewController.h
//  HandleYorTimev1.1
//
//  Created by Daniel on 23/01/15.
//  Copyright (c) 2015 idesigndreams. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "GroundTableViewCell.h"



@interface EditProfileViewController : UIViewController<

NSObject>
{


    NSArray *EditsArray;
    
}

@property (nonatomic, strong) PFObject *profile;


@property (strong, nonatomic) IBOutlet UIImageView *userImage;
@property (strong, nonatomic) IBOutlet UILabel *userProfile;
@property (strong, nonatomic) IBOutlet UILabel *phoneProfile;

@property (strong, nonatomic) IBOutlet UILabel *mailProfile;



@property (weak, nonatomic) IBOutlet UIView *favoritesOverlayView;

@property (strong, nonatomic) IBOutlet UITextView *notesProfileLabel;


@property (strong, nonatomic) IBOutlet UITextView *favouritesLabelProfile;
@property (strong, nonatomic) IBOutlet UIView *notesOverlayView;

@property (strong, nonatomic) IBOutlet UIView *profileOverlayView;



- (IBAction)favouritesButton:(id)sender;

- (IBAction)contactButton:(id)sender;

- (IBAction)notesButton:(id)sender;


@end

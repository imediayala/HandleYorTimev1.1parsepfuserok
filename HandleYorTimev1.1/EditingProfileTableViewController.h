//
//  EditingProfileTableViewController.h
//  HandleYorTimev1.1
//
//  Created by Daniel on 27/04/15.
//  Copyright (c) 2015 idesigndreams. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface EditingProfileTableViewController : UITableViewController< UIImagePickerControllerDelegate, UINavigationControllerDelegate>{


}
@property (strong, nonatomic) IBOutlet UITextField *editUser;
@property (strong, nonatomic) IBOutlet UITextField *editPassword;
@property (strong, nonatomic) IBOutlet UITextField *editEMail;
@property (strong, nonatomic) IBOutlet UITextField *editPhone;
@property (strong, nonatomic) IBOutlet UITextView *editNotes;
@property (strong, nonatomic) IBOutlet UITextView *editFavorites;


@property (strong, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)takePhoto:  (UIButton *)sender;
- (IBAction)selectPhoto:(UIButton *)sender;



- (IBAction)sendLogOut:(id)sender;


- (IBAction)sendEdits:(id)sender;


@end

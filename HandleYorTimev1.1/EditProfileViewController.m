//
//  EditProfileViewController.m
//  HandleYorTimev1.1
//
//  Created by Daniel on 23/01/15.
//  Copyright (c) 2015 idesigndreams. All rights reserved.
//

#import "EditProfileViewController.h"
#import <Parse/Parse.h>
#import "GroundTableViewCell.h"

@interface EditProfileViewController ()

@end

@implementation EditProfileViewController
@synthesize userImage;
@synthesize userProfile;
@synthesize mailProfile;
@synthesize phoneProfile;
@synthesize profile;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(IBAction)prepareForUnwind:(UIStoryboardSegue *)segue {
}


- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    PFUser *currentUser = [PFUser currentUser];
    if (currentUser) {
        // do stuff with the user
    } else {
        // show the signup or login screen
    }
   
    
    
   
    
    // Do any additional setup after loading the view.
    
    [self performSelector:@selector(retrieveFromParse)];
    
//        self.userProfile.text = [[PFUser currentUser]username];@"username";
    
    
    
    // Set the Label text with the selected detail.
    //
    //    self.userImage.image = [self.profile objectForKey:@"image"];
    
    
}

- (void) retrieveFromParse {
    
    
   
    
    PFQuery *query = [PFUser query];
    
    [query whereKey:@"username" equalTo:[[PFUser currentUser] username]];
    [query findObjectsInBackgroundWithBlock:^(NSArray *results, NSError *error) {
        
        // with this query you are asking parse.com for ALL user, and of each user you will receive user, image, email and ohone fields. As you can see you are receiving an Array of PFUser. For example we are interested only to the first item of this array. So:
        
                PFObject* profilePhotoObject = results[0];
                PFFile* currentUserPhoto = (PFFile *)[profilePhotoObject objectForKey:@"image"];
        
        PFUser *userOfMyInterest = (PFUser *)[results objectAtIndex:0];
        self.profile = userOfMyInterest;
        [self updateUI];
        
        
        
                UIImageView* currentUserImage = [[UIImageView alloc]initWithImage:[UIImage imageWithData:currentUserPhoto.getData]];
                currentUserImage.frame = CGRectMake(0, 0, userImage.frame.size.width, 103);
        
                [self.userImage addSubview:currentUserImage];

        
        
        
        
       
    }];
    
    
}

- (void)updateUI {
    self.userProfile.text = [self.profile objectForKey:@"username"];
    self.mailProfile.text = [self.profile objectForKey:@"email"];
    self.phoneProfile.text = [self.profile objectForKey:@"phone"];
    self.favouritesLabelProfile.text = [self.profile objectForKey:@"favorites"];
    self.notesProfileLabel.text = [self.profile objectForKey:@"notes"];
//    self.userImage.image = [self.profile objectForKey:@"image"];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


    
    


- (IBAction)favouritesButton:(id)sender {
    
    _favoritesOverlayView.hidden = NO; // YES/NO
    
    _notesOverlayView.hidden = YES;
    
    _profileOverlayView.hidden = YES;


    
    _favoritesOverlayView.alpha = 0;
    _favoritesOverlayView.hidden = NO;
    [UIView animateWithDuration:0.6 animations:^{
        _favoritesOverlayView.alpha = 1;
    }];
    
   
}

- (IBAction)contactButton:(id)sender {
    
        _favoritesOverlayView.hidden = YES; // YES/NO
        _notesOverlayView.hidden = YES;
        _profileOverlayView.hidden = NO;
    
    _profileOverlayView.alpha = 0;
    _profileOverlayView.hidden = NO;
    [UIView animateWithDuration:0.6 animations:^{
        _profileOverlayView.alpha = 1;
    }];
    
    
    
    
    
    
    
//    [UIView transitionWithView:_notesOverlayView
//                      duration:0.6
//                       options:UIViewAnimationOptionTransitionCrossDissolve
//                    animations:NULL
//                    completion:NULL];
//    
//    
//    [UIView transitionWithView:_favoritesOverlayView
//                      duration:0.6
//                       options:UIViewAnimationOptionTransitionCrossDissolve
//                    animations:NULL
//                    completion:NULL];


    
}

- (IBAction)notesButton:(id)sender {
    
    _favoritesOverlayView.hidden = YES;
    _notesOverlayView.hidden = NO;
    _profileOverlayView.hidden = YES;

    _notesOverlayView.alpha = 0;
    _notesOverlayView.hidden = NO;
    [UIView animateWithDuration:0.6 animations:^{
        _notesOverlayView.alpha = 1;
    }];
    
    
    
    
    
//    
//    [UIView transitionWithView:_favoritesOverlayView
//                      duration:0.6
//                       options:UIViewAnimationOptionTransitionCrossDissolve
//                    animations:NULL
//                    completion:NULL];
//    
//    [UIView transitionWithView:_notesOverlayView
//                      duration:0.6
//                       options:UIViewAnimationOptionTransitionCrossDissolve
//                    animations:NULL
//                    completion:NULL];
}






//set edit button

//- (void)setEditing:(BOOL)flag animated:(BOOL)animated
//{
//
//
//
//    [super setEditing:flag animated:animated];
//    if (flag == YES){
//        // Change views to edit mode.
//    }
//    else {
//        // Save the changes if needed and change the views to noneditable.
//    }
//}

//*********************Setup table of folder names ************************

//get number of sections in tableview

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    // Return the number of sections.
//    return 1;
//}
//
//get number of rows by counting number of folders






/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */


///Method to save photos from iphone

//- (IBAction)takePhoto:(UIButton *)sender {
//
//
//
//
//    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
//    picker.delegate = self;
//    picker.allowsEditing = YES;
//    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
//
//    [self presentViewController:picker animated:YES completion:NULL];
//
//
//
//
//
//}

//- (IBAction)selectPhoto:(UIButton *)sender {
//
//    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
//    picker.delegate = self;
//    picker.allowsEditing = YES;
//    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//
//    [self presentViewController:picker animated:YES completion:NULL];
//
//
//}
//
//- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
//
//    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
//    self.imageView.image = chosenImage;
//
//    [picker dismissViewControllerAnimated:YES completion:NULL];
//
//}
//
//- (void) imagePickerControllerDidCancel:(UIImagePickerController *)picker {
//    [self dismissViewControllerAnimated:YES completion:NULL];
//}
//
//





    
    


@end

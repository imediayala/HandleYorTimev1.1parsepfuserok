//
//  loginViewController.h
//  HandleYorTimev1.1
//
//  Created by Daniel on 21/01/15.
//  Copyright (c) 2015 idesigndreams. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface loginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *reEnterPasswordField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIView *loginOverlayView;
- (IBAction)registeredButton:(id)sender;

- (IBAction)registerAction:(id)sender;
- (IBAction)loginButton:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *loginUsernameField;
@property (weak, nonatomic) IBOutlet UITextField *loginPasswordField;



@end

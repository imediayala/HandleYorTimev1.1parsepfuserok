//
//  loginViewController.m
//  HandleYorTimev1.1
//
//  Created by Daniel on 21/01/15.
//  Copyright (c) 2015 idesigndreams. All rights reserved.
//

#import "loginViewController.h"
#import <Parse/Parse.h>

@interface loginViewController ()

@end

@implementation loginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated{
    PFUser *user = [PFUser currentUser];
    if (user.username != nil) {
        [self performSegueWithIdentifier:@"login" sender:self];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



//- (IBAction)registerAtion:(id)sender {
//}







- (void) checkFieldsComplete { //check user has completed all fields
    if ([_usernameField.text isEqualToString:@""] || [_emailField.text isEqualToString:@""] || [_passwordField.text isEqualToString:@""] || [_reEnterPasswordField.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oooopss!" message:@"You need to complete all fields" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else {
        [self checkPasswordsMatch];
    }
}

- (void) checkPasswordsMatch { //check users entered passwords match
    if (![_passwordField.text isEqualToString:_reEnterPasswordField.text]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oooopss!" message:@"Passwords don't match" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else {
        [self registerNewUser];
    }
}

//all fields are valid, register new user in Parse
- (void) registerNewUser {
    NSLog(@"registering....");
    PFUser *newUser = [PFUser user];
    newUser.username = _usernameField.text;
    newUser.email = _emailField.text;
    newUser.password = _passwordField.text;
    
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            NSLog(@"Registration success!");
            [self performSegueWithIdentifier:@"login" sender:self];
        }
        else {
            NSLog(@"There was an error in registration");
        }
    }];
}


- (IBAction)registeredButton:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        _loginOverlayView.frame = self.view.frame;
        
    }];
    
    
    
}



- (IBAction)loginButton:(id)sender {
    
    
[PFUser logInWithUsernameInBackground:_loginUsernameField.text password:_loginPasswordField.text block:^(PFUser *
    user, NSError *error) {
    if (!error) {
        NSLog(@"Login user!");
        [self performSegueWithIdentifier:@"login" sender:self];
        
        
    }
    
    if (error) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"mierda!" message:@"Disculpa tenemos un problema con tu login" delegate:self cancelButtonTitle:@"OK"
            otherButtonTitles:nil];
        
        [alert show];
    }
    
    
}];
 
    
}


- (IBAction)registerAction:(id)sender { //hide keyboard and begin registration checks
    [_usernameField resignFirstResponder];
    [_emailField resignFirstResponder];
    [_passwordField resignFirstResponder];
    [_reEnterPasswordField resignFirstResponder];
    [self checkFieldsComplete];
}



@end

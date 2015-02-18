//
//  ComposeViewController.m
//  HandleYorTimev1.1
//
//  Created by Daniel on 03/02/15.
//  Copyright (c) 2015 idesigndreams. All rights reserved.
//

#import "ComposeViewController.h"
#import <Parse/Parse.h>


@interface ComposeViewController ()

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    PFUser *currentUser = [PFUser currentUser];
    if (currentUser) {
        // do stuff with the user
    } else {
        // show the signup or login screen
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

- (IBAction)sendGround:(id)sender {
    
//    PFObject *Ground = [PFObject objectWithClassName:@"Grounds"];
//    Ground[@"content"] = _groundTextView.text;
//    
//    
//    [Ground saveInBackground];
    
    
    
    //Upload a new picture
    //1
    
//    PFFile *file = [PFFile fileWithName:@"img" data:pictureData];
//    [file saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
  
            //2
            //Add the image to the object, and add the comment and the user
            PFObject *Ground = [PFObject objectWithClassName:@"Grounds"];
            [Ground setObject:[PFUser currentUser].username forKey:@"user"];
            [Ground setObject:self.groundTextView.text forKey:@"comment"];
            //3
            [Ground saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                //4
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

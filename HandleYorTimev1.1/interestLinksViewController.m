//
//  interestLinksViewController.m
//  HandleYorTimev1.1
//
//  Created by Daniel on 09/05/15.
//  Copyright (c) 2015 idesigndreams. All rights reserved.
//

#import "interestLinksViewController.h"

@interface interestLinksViewController ()

@end

@implementation interestLinksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    UIBarButtonItem *btn_Back = [[UIBarButtonItem alloc] initWithTitle:@""
//                                                                 style:UIBarButtonItemStylePlain target:nil action:nil];
//    self.navigationItem.backBarButtonItem=btn_Back;
//    
//
    [self.navigationController.interactivePopGestureRecognizer setDelegate:nil];
//    
//    [super viewDidLoad];
//    [self.navigationController setNavigationBarHidden:YES animated:NO]; // and animated:YES
    
    
    [self.navigationItem setHidesBackButton:YES animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// Dissapear nav controller


//- (void) viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:animated];
//}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


    
- (IBAction)linkAena:(id)sender {
    
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.aena.es/csee/Satellite/HomeAena"]];
}

- (IBAction)linkFlightTracker:(id)sender {
    
     [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://es.flightaware.com/live/"]];
    
    
}

- (IBAction)linkCitiesDecoder:(id)sender {
    
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.dafarra.it/Airports.pdf"]];
    
}

- (IBAction)linkTheLastMinutePax:(id)sender {
}
  @end

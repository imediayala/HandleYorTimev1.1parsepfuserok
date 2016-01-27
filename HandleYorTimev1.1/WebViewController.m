//
//  WebViewController.m
//  HandleYorTimev1.1
//
//  Created by Daniel on 30/03/15.
//  Copyright (c) 2015 idesigndreams. All rights reserved.
//

#import "WebViewController.h"

@interface UIViewController ()

@end

@implementation WebViewController


-(void)loadDocument:(NSString*)documentName inView:(UIWebView*)webView
{
    NSString *path = [[NSBundle mainBundle] pathForResource:documentName ofType:nil];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];

}




// Calling -loadDocument:inView:


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [self loadDocument:@"TEST_PDF.pdf" inView:self.Viewer];

    // Do any additional setup after loading the view.
    
//    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Test_PDF" ofType:@"pdf"];
//    url = [NSURL fileURLWithPath:filePath];
//    [webView loadRequest:[NSURLRequest requestWithURL:url]];
//    
    
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

@end

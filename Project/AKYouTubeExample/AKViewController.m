//
//  AKViewController.m
//  AKYouTubeExample
//
//  Created by Adil  Virani on 4/9/15.
//  Copyright (c) 2015 Adil  Virani. All rights reserved.
//

#import "AKViewController.h"
#import "AKConstants.h"

@interface AKViewController ()

@property (nonatomic, weak) IBOutlet UILabel *status;
@property (nonatomic, assign) BOOL isConnected;

@end

@implementation AKViewController

#pragma mark - Actions

- (IBAction)pressedConnect:(UIButton *)sender {
    self.status.enabled = NO;
    self.status.text = @"Connecting ...";
    
    YTConnector.sharedInstance.delegate = self;
    [YTConnector.sharedInstance connectWithClientId:AKClientId andClientSecret:AKClientSecret];
}

#pragma mark - Connector Delegate

- (void)presentLoginViewControler:(UIViewController<YTLoginViewControllerInterface> *)loginViewController {
    NSLog(@"Presenting default login view controller ...");
    
    loginViewController.shouldPresentCloseButton = YES;
    [self presentViewController:loginViewController animated:YES completion:NULL];
}
- (void)connectionEstablished {
    [self dismissViewControllerAnimated:YES completion:^{
        self.isConnected = YES;
        self.status.text = @"Connected";
        
        [YTConnector.sharedInstance freeLoginViewController];
        
        NSLog(@"Connection established");
    }];
}
- (void)connectionDidFailWithError:(NSError *)error {
    [self dismissViewControllerAnimated:YES completion:^{
        self.isConnected = NO;
        self.status.text = @"Connection error";
        
        [YTConnector.sharedInstance freeLoginViewController];
        
        NSLog(@"%@ - Connection failed: %@", NSStringFromClass(self.class), error);
    }];
}
- (void)appDidFailAuthorize {
    NSLog(@"App did fail authorize, present default login view controller ...");
    
    self.status.text = @"Authorizing ...";
    [YTConnector.sharedInstance authorizeAppWithScopesList:nil inLoginViewController:nil];
}
- (void)userRejectedApp {
    [self dismissViewControllerAnimated:YES completion:^{
        self.isConnected = NO;
        self.status.text = @"Rejected";

        [YTConnector.sharedInstance freeLoginViewController];
        
        NSLog(@"User rejected app");
    }];
}

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.isConnected = NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

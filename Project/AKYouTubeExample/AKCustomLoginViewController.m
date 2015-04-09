//
//  AKCustomLoginViewController.m
//  AKYouTubeExample
//
//  Created by Adil  Virani on 4/9/15.
//  Copyright (c) 2015 Adil  Virani. All rights reserved.
//

#import "AKCustomLoginViewController.h"

@interface AKCustomLoginViewController ()

@property (nonatomic, strong) IBOutlet UIWebView *webView;

@end

@implementation AKCustomLoginViewController

#pragma mark - Synthesizes

@synthesize webView = _webView;
@synthesize connector = _connector;

#pragma mark - Lifecycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.connector authorizeAppWithScopesList:nil
                         inLoginViewController:(UIViewController<YTLoginViewControllerInterface> *)self];
}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [self.connector freeLoginViewController];
}
- (void)dealloc {
    self.webView.delegate = nil;
    [self.webView stopLoading];
}

@end

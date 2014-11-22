//
//  JLEThreadViewController.m
//  Rojo
//
//  Created by Julius Parishy on 11/21/14.
//  Copyright (c) 2014 Julius Parishy. All rights reserved.
//

#import "JLEThreadViewController.h"

#import "JLEThread.h"

#import "JLERedditClient.h"
#import "JLEThreadAPI.h"

#import "JLEThreadCommentsViewController.h"

#import "UIView+LECommonLayoutConstraints.h"

@interface JLEThreadViewController ()

@property (nonatomic, strong) JLEThreadAPI *api;

@property (nonatomic, strong) JLEThreadCommentsViewController *commentsViewController;

@end

@implementation JLEThreadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initializeThreadsListViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)initializeThreadsListViewController
{
    self.commentsViewController = [[JLEThreadCommentsViewController alloc] init];
    self.commentsViewController.theme = self.theme;
    self.commentsViewController.api = self.api;
    
    [self addChildViewController:self.commentsViewController];
    
    UIView *view = self.commentsViewController.view;
    view.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:view];
    [self.view le_addContraintsForFilledView:view insets:UIEdgeInsetsZero];
}

- (void)setThread:(JLEThread *)thread
{
    _thread = thread;
    
    self.api = [[JLEThreadAPI alloc] initWithClient:self.client thread:thread];
    self.title = thread.title;
}

@end

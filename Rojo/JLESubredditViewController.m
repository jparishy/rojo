//
//  JLESubredditViewController.m
//  Rojo
//
//  Created by Julius Parishy on 11/16/14.
//  Copyright (c) 2014 Julius Parishy. All rights reserved.
//

#import "JLESubredditViewController.h"

#import "JLERedditClient.h"
#import "JLESubredditAPI.h"

#import "JLESubreddit.h"
#import "JLEThread.h"

#import "JLESubredditThreadsListViewController.h"
#import "JLEThreadViewController.h"

#import "UIView+LECommonLayoutConstraints.h"

@interface JLESubredditViewController () <JLESubredditThreadsListViewControllerDelegate>

@property (nonatomic, strong) JLESubredditAPI *api;

@property (nonatomic, strong) JLESubredditThreadsListViewController *threadsListViewController;

@end

@implementation JLESubredditViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initializeThreadsListViewController];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)initializeThreadsListViewController
{
    self.threadsListViewController = [[JLESubredditThreadsListViewController alloc] init];
    self.threadsListViewController.theme = self.theme;
    self.threadsListViewController.api = self.api;
    
    self.threadsListViewController.delegate = self;
    
    [self addChildViewController:self.threadsListViewController];
    
    UIView *view = self.threadsListViewController.view;
    view.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:view];
    [self.view le_addContraintsForFilledView:view insets:UIEdgeInsetsZero];
}

- (void)setSubreddit:(JLESubreddit *)subreddit
{
    _subreddit = subreddit;
    
    self.api = [[JLESubredditAPI alloc] initWithClient:self.client subreddit:subreddit];
    self.title = [subreddit name];
}

- (void)presentThreadViewControllerForThread:(JLEThread *)thread
{
    JLEThreadViewController *viewController = [[JLEThreadViewController alloc] init];
    viewController.theme = self.theme;
    viewController.client = self.client;
    viewController.thread = thread;
    
    [self.navigationController pushViewController:viewController animated:YES];
}

#pragma mark - JLESubredditThreadsListViewControllerDelegate

- (void)subredditThreadsListViewController:(JLESubredditThreadsListViewController *)viewController didSelectThread:(JLEThread *)thread
{
    [self presentThreadViewControllerForThread:thread];
}

@end

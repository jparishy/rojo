//
//  JLESubredditViewController.m
//  Rojo
//
//  Created by Julius Parishy on 11/16/14.
//  Copyright (c) 2014 Julius Parishy. All rights reserved.
//

#import "JLESubredditViewController.h"

#import "JLESubreddit.h"
#import "JLESubredditThreadsListViewController.h"

#import "UIView+LECommonLayoutConstraints.h"

@interface JLESubredditViewController ()

@property (nonatomic, strong) JLESubredditThreadsListViewController *threadsListViewController;

@end

@implementation JLESubredditViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initializeThreadsListViewController];
}

- (void)initializeThreadsListViewController
{
    self.threadsListViewController = [[JLESubredditThreadsListViewController alloc] init];
    [self addChildViewController:self.threadsListViewController];
    
    UIView *view = self.threadsListViewController.view;
    view.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:view];
    [self.view le_addContraintsForFilledView:view insets:UIEdgeInsetsZero];
}

- (void)setSubreddit:(JLESubreddit *)subreddit
{
    _subreddit = subreddit;
    
    self.title = [subreddit name];
}

@end

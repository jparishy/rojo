//
//  JLESubredditListViewController.m
//  Rojo
//
//  Created by Julius Parishy on 11/18/14.
//  Copyright (c) 2014 Julius Parishy. All rights reserved.
//

#import "JLESubredditListViewController.h"

#import "JLESubreddit.h"

#import "JLESubredditListCell.h"

#import "UIView+LECommonLayoutConstraints.h"

@interface JLESubredditListViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation JLESubredditListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initializeTableView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
    [self.tableView deselectRowAtIndexPath:indexPath animated:animated];
}

- (void)initializeTableView
{
    self.tableView = [[UITableView alloc] init];
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:self.tableView];
    [self.view le_addContraintsForFilledView:self.tableView insets:UIEdgeInsetsZero];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [JLESubredditListCell jle_registerNibInTableView:self.tableView];
}

- (void)setSubreddits:(NSArray *)subreddits
{
    _subreddits = subreddits;
    
    [self.tableView reloadData];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSCAssert(self.delegate, @"Delegate not set.");
    
    NSInteger index = indexPath.row;
    JLESubreddit *subreddit = self.subreddits[index];
    
    [self.delegate subredditListViewController:self didSelectSubreddit:subreddit];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.subreddits.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = [JLESubredditListCell jle_defaultReuseIdentifier];
    JLESubredditListCell *cell = [self.tableView dequeueReusableCellWithIdentifier:identifier];
    
    cell.theme = self.theme;
    
    NSInteger index = indexPath.row;
    JLESubreddit *subreddit = self.subreddits[index];
    
    cell.subreddit = subreddit;
    
    return cell;
}


@end

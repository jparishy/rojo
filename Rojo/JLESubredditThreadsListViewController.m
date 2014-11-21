//
//  JLESubredditThreadsListViewController.m
//  Rojo
//
//  Created by Julius Parishy on 11/16/14.
//  Copyright (c) 2014 Julius Parishy. All rights reserved.
//

#import "JLESubredditThreadsListViewController.h"

#import "UIView+LECommonLayoutConstraints.h"

@interface JLESubredditThreadsListViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation JLESubredditThreadsListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initializeTableView];
}

- (void)initializeTableView
{
    self.tableView = [[UITableView alloc] init];
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:self.tableView];
    
    [self.view le_addContraintsForFilledView:self.tableView insets:UIEdgeInsetsZero];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

#pragma mark - UITableViewDelegate

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

@end

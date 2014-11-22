//
//  JLESubredditThreadsListViewController.m
//  Rojo
//
//  Created by Julius Parishy on 11/16/14.
//  Copyright (c) 2014 Julius Parishy. All rights reserved.
//

#import "JLESubredditThreadsListViewController.h"

#import "JLESubreddit.h"
#import "JLEThread.h"

#import "JLEThreadListCell.h"

#import "JLEPagingTableController.h"

#import "UITableViewCell+JLEDefaultReuseIdentifier.h"
#import "UIView+LECommonLayoutConstraints.h"

@interface JLESubredditThreadsListViewController () <UITableViewDelegate,
                                                     JLEPagingTableControllerDelegate>

@property (nonatomic, strong) JLEPagingTableController *tableController;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation JLESubredditThreadsListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initializeTableView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self refreshThreads];
}

- (void)initializeTableView
{
    self.tableView = [[UITableView alloc] init];
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:self.tableView];
    
    [self.view le_addContraintsForFilledView:self.tableView insets:UIEdgeInsetsZero];
    
    self.tableView.delegate = self;
    
    self.tableController = [[JLEPagingTableController alloc] initWithTableView:self.tableView delegate:self];
    
    [JLEThreadListCell jle_registerNibInTableView:self.tableView];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    JLEThread *thread = [self.tableController modelForIndexPath:indexPath];
    [self.delegate subredditThreadsListViewController:self didSelectThread:thread];
}

#pragma mark - Networking

- (void)refreshThreads
{
    @weakify(self);
    [self.api requestThreadsWithSuccess:^(NSArray *threads) {
        
        @strongify(self);
        self.tableController.models = threads;
        
    } failure:^(NSError *error) {
        
        NSLog(@"%@", error);
    }];
}

#pragma mark - JLEPagingTableControllerDelegate

- (UITableViewCell *)configuredCellForModel:(JLEThread *)model atIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = [JLEThreadListCell jle_defaultReuseIdentifier];
    JLEThreadListCell *cell = (JLEThreadListCell *)[self.tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    cell.theme = self.theme;
    cell.thread = model;
    
    return cell;
}

@end

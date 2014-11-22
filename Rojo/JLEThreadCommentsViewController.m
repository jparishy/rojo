//
//  JLEThreadCommentsViewController.m
//  Rojo
//
//  Created by Julius Parishy on 11/21/14.
//  Copyright (c) 2014 Julius Parishy. All rights reserved.
//

#import "JLEThreadCommentsViewController.h"

#import "JLEThreadAPI.h"

#import "JLECommentCell.h"

#import "JLEPagingTableController.h"

#import "UIView+LECommonLayoutConstraints.h"

@interface JLEThreadCommentsViewController () <UITableViewDelegate,
                                               JLEPagingTableControllerDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) JLEPagingTableController *tableController;

@end

@implementation JLEThreadCommentsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initializeTableView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self refreshComments];
}

- (void)initializeTableView
{
    self.tableView = [[UITableView alloc] init];
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:self.tableView];
    
    [self.view le_addContraintsForFilledView:self.tableView insets:UIEdgeInsetsZero];
    
    self.tableView.delegate = self;
    
    self.tableController = [[JLEPagingTableController alloc] initWithTableView:self.tableView delegate:self];
    
    [JLECommentCell jle_registerNibInTableView:self.tableView];
}

#pragma mark - UITableViewDelegate

#pragma mark - Networking

- (void)refreshComments
{
    @weakify(self);
    [self.api requestCommentsWithSuccess:^(NSArray *comments) {
        
        @strongify(self);
        self.tableController.models = comments;
        
    } failure:^(NSError *error) {
        
        NSLog(@"%@", error);
    }];
}

#pragma mark - JLEPagingTableControllerDelegate

- (UITableViewCell *)configuredCellForModel:(JLEComment *)model atIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = [JLECommentCell jle_defaultReuseIdentifier];
    JLECommentCell *cell = (JLECommentCell *)[self.tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    cell.theme = self.theme;
    cell.comment = model;
    
    return cell;
}


@end

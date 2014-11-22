//
//  JLEPagingTableController.m
//  Rojo
//
//  Created by Julius Parishy on 11/21/14.
//  Copyright (c) 2014 Julius Parishy. All rights reserved.
//

#import "JLEPagingTableController.h"

@implementation JLEPagingTableController

- (instancetype)initWithTableView:(UITableView *)tableView delegate:(id<JLEPagingTableControllerDelegate>)delegate
{
    NSCParameterAssert(tableView);
    NSCParameterAssert(delegate);
    
    if((self = [super init]))
    {
        _tableView = tableView;
        _delegate  = delegate;
        
        _tableView.dataSource = self;
    }
    
    return self;
}

- (void)setModels:(NSArray *)models
{
    _models = models;
    
    [self.tableView reloadData];
}

- (NSArray *)indexPathsFromStartIndex:(NSInteger)startIndex count:(NSInteger)count section:(NSInteger)section
{
    NSMutableArray *indexPaths = [[NSMutableArray alloc] init];
    
    for(NSInteger row = startIndex; row < (startIndex + count); ++row)
    {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
        [indexPaths addObject:indexPath];
    }
    
    return [indexPaths copy];
}

- (void)appendModels:(NSArray *)models
{
    NSInteger startIndex = self.models.count;
    NSInteger count = models.count;
    
    NSArray *indexPaths = [self indexPathsFromStartIndex:startIndex count:count section:0];
    
    _models = [_models arrayByAddingObjectsFromArray:models];
    
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)prependModels:(NSArray *)models
{
    NSInteger startIndex = 0;
    NSInteger count = models.count;
    
    NSArray *indexPaths = [self indexPathsFromStartIndex:startIndex count:count section:0];
    
    _models = [_models arrayByAddingObjectsFromArray:models];
    
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.models.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger index = indexPath.row;
    id model = self.models[index];
    
    UITableViewCell *cell = [self.delegate configuredCellForModel:model atIndexPath:indexPath];
    return cell;
}

@end

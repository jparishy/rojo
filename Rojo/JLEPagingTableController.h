//
//  JLEPagingTableController.h
//  Rojo
//
//  Created by Julius Parishy on 11/21/14.
//  Copyright (c) 2014 Julius Parishy. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JLEPagingTableControllerDelegate;

@interface JLEPagingTableController : NSObject<UITableViewDataSource>

@property (nonatomic, weak, readonly) UITableView *tableView;
@property (nonatomic, unsafe_unretained, readonly) id<JLEPagingTableControllerDelegate> delegate;

@property (nonatomic, strong) NSArray *models;

- (instancetype)initWithTableView:(UITableView *)tableView delegate:(id<JLEPagingTableControllerDelegate>)delegate;

- (void)appendModels:(NSArray *)models;
- (void)prependModels:(NSArray *)models;

@end

@protocol JLEPagingTableControllerDelegate <NSObject>

@required
- (UITableViewCell *)configuredCellForModel:(id)model atIndexPath:(NSIndexPath *)indexPath;

@end

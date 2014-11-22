//
//  JLESubredditThreadsListViewController.h
//  Rojo
//
//  Created by Julius Parishy on 11/16/14.
//  Copyright (c) 2014 Julius Parishy. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "JLESubredditAPI.h"

@protocol JLESubredditThreadsListViewControllerDelegate;

@interface JLESubredditThreadsListViewController : UIViewController

@property (nonatomic, weak) JLETheme *theme;
@property (nonatomic, strong) JLESubredditAPI *api;
@property (nonatomic, unsafe_unretained) id<JLESubredditThreadsListViewControllerDelegate> delegate;

@end

@protocol JLESubredditThreadsListViewControllerDelegate <NSObject>

@required
- (void)subredditThreadsListViewController:(JLESubredditThreadsListViewController *)viewController didSelectThread:(JLEThread *)thread;

@end

//
//  JLESubredditListViewController.h
//  Rojo
//
//  Created by Julius Parishy on 11/18/14.
//  Copyright (c) 2014 Julius Parishy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JLESubreddit;
@protocol JLESubredditListViewControllerDelegate;

@interface JLESubredditListViewController : UIViewController

@property (nonatomic, weak) JLETheme *theme;

@property (nonatomic, unsafe_unretained) id<JLESubredditListViewControllerDelegate> delegate;
@property (nonatomic, copy) NSArray *subreddits;

@end

@protocol JLESubredditListViewControllerDelegate <NSObject>

@required
- (void)subredditListViewController:(JLESubredditListViewController *)viewController didSelectSubreddit:(JLESubreddit *)subreddit;

@end
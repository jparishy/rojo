//
//  JLESubredditViewController.h
//  Rojo
//
//  Created by Julius Parishy on 11/16/14.
//  Copyright (c) 2014 Julius Parishy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JLESubreddit;
@class JLERedditClient;

@interface JLESubredditViewController : UIViewController

@property (nonatomic, weak) JLETheme *theme;
@property (nonatomic, strong) JLERedditClient *client;
@property (nonatomic, strong) JLESubreddit *subreddit;

@end

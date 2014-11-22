//
//  JLESubredditThreadsListViewController.h
//  Rojo
//
//  Created by Julius Parishy on 11/16/14.
//  Copyright (c) 2014 Julius Parishy. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "JLESubredditAPI.h"

@interface JLESubredditThreadsListViewController : UIViewController

@property (nonatomic, weak) JLETheme *theme;
@property (nonatomic, strong) JLESubredditAPI *api;

@end

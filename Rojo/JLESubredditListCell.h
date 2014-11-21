//
//  JLESubredditListCell.h
//  Rojo
//
//  Created by Julius Parishy on 11/18/14.
//  Copyright (c) 2014 Julius Parishy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JLESubreddit;

@interface JLESubredditListCell : UITableViewCell

@property (nonatomic, weak) JLETheme *theme;
@property (nonatomic, strong) JLESubreddit *subreddit;

@end

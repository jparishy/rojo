//
//  JLESubredditListCell.m
//  Rojo
//
//  Created by Julius Parishy on 11/18/14.
//  Copyright (c) 2014 Julius Parishy. All rights reserved.
//

#import "JLESubredditListCell.h"

#import "JLESubreddit.h"

@implementation JLESubredditListCell

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)setTheme:(JLETheme *)theme
{
    _theme = theme;
    
    self.textLabel.highlightedTextColor = [theme highlightedTextColor];
    
    UIView *selectedBackgroundView = [[UIView alloc] initWithFrame:self.bounds];
    selectedBackgroundView.backgroundColor = [theme highlightedBackgroundColor];
    
    self.selectedBackgroundView = selectedBackgroundView;
}

- (void)setSubreddit:(JLESubreddit *)subreddit
{
    _subreddit = subreddit;
    
    [self adaptToSubreddit:subreddit];
}

- (void)adaptToSubreddit:(JLESubreddit *)subreddit
{
    NSString *text = [subreddit name];
    self.textLabel.text = text;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

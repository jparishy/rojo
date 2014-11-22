//
//  JLEThreadListCell.m
//  Rojo
//
//  Created by Julius Parishy on 11/21/14.
//  Copyright (c) 2014 Julius Parishy. All rights reserved.
//

#import "JLEThreadListCell.h"

#import "JLEThread.h"

@implementation JLEThreadListCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setTheme:(JLETheme *)theme
{
    _theme = theme;
    
    self.textLabel.highlightedTextColor = [theme highlightedTextColor];
    
    UIView *selectedBackgroundView = [[UIView alloc] initWithFrame:self.bounds];
    selectedBackgroundView.backgroundColor = [theme highlightedBackgroundColor];
    
    self.selectedBackgroundView = selectedBackgroundView;
}

- (void)setThread:(JLEThread *)thread
{
    _thread = thread;
    
    [self adaptToThread:thread];
}

- (void)adaptToThread:(JLEThread *)thread
{
    self.textLabel.text = thread.title;
}

@end

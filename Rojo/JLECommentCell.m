//
//  JLECommentCell.m
//  Rojo
//
//  Created by Julius Parishy on 11/21/14.
//  Copyright (c) 2014 Julius Parishy. All rights reserved.
//

#import "JLECommentCell.h"

#import "JLEComment.h"

@implementation JLECommentCell

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
}

- (void)setComment:(JLEComment *)comment
{
    _comment = comment;
    
    [self adaptToComment:comment];
}

- (void)adaptToComment:(JLEComment *)comment
{
    self.textLabel.text = comment.body;
    self.indentationLevel = comment.indentationLevel;
    
    NSLog(@"%d", comment.indentationLevel);
}

@end

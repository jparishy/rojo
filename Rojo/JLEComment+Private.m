//
//  JLEComment+Private.m
//  Rojo
//
//  Created by Julius Parishy on 11/21/14.
//  Copyright (c) 2014 Julius Parishy. All rights reserved.
//

#import "JLEComment+Private.h"

@implementation JLEComment (Private)

- (void)_postProcess
{
    [self _postProcessComment:self withParent:nil indentationLevel:0];
}

- (void)_postProcessComment:(JLEComment *)comment withParent:(JLEComment *)parent indentationLevel:(NSInteger)indentationLevel
{
    comment->_parentComment = parent;
    comment->_indentationLevel = indentationLevel;
    
    for(JLEComment *child in comment.replies)
    {
        [self _postProcessComment:child withParent:comment indentationLevel:(indentationLevel + 1)];
    }
}

@end

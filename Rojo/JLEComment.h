//
//  JLEComment.h
//  Rojo
//
//  Created by Julius Parishy on 11/21/14.
//  Copyright (c) 2014 Julius Parishy. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface JLEComment : MTLModel<MTLJSONSerializing>
{
@private
    __weak JLEComment *_parentComment;
    NSInteger _indentationLevel;
}


@property (nonatomic, copy, readonly) NSString *authorUsername;
@property (nonatomic, copy, readonly) NSString *body;

@property (nonatomic, strong, readonly) NSDate *timestamp;

@property (nonatomic, assign, readonly) NSInteger score;
@property (nonatomic, assign, readonly) NSInteger numberOfUpvotes;
@property (nonatomic, assign, readonly) NSInteger numberOfDownvotes;

@property (nonatomic, strong, readonly) NSArray *replies;

@property (nonatomic, assign, readonly) NSInteger indentationLevel;
@property (nonatomic, weak, readonly) JLEComment *parentComment;

- (NSInteger)totalNumberOfCommentsInCommentThread;

@end

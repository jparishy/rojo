//
//  JLEComment.m
//  Rojo
//
//  Created by Julius Parishy on 11/21/14.
//  Copyright (c) 2014 Julius Parishy. All rights reserved.
//

#import "JLEComment.h"

@implementation JLEComment

@synthesize parentComment=_parentComment;
@synthesize indentationLevel=_indentationLevel;

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
        @"authorUsername" : @"data.author",
        @"body" : @"data.body",
        
        @"timestamp" : @"data.created_utc",
        
        @"score" : @"data.score",
        @"numberOfUpvotes" : @"data.ups",
        @"numberOfDownvotes" : @"data.downs",
        
        @"replies" : @"replies"
    };
}

+ (NSValueTransformer *)timestampJSONTransformer
{
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSNumber *epoch) {
        return [NSDate dateWithTimeIntervalSince1970:epoch.integerValue];
    } reverseBlock:^id(NSDate *timestamp) {
        return @([timestamp timeIntervalSince1970]);
    }];
}

+ (NSValueTransformer *)repliesJSONTransformer
{
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[JLEComment class]];
}

- (NSInteger)totalNumberOfCommentsInCommentThread
{
    return [[self.replies bk_reduce:@(1) withBlock:^id(NSNumber *sum, JLEComment *comment) {
        return @(sum.integerValue + [comment totalNumberOfCommentsInCommentThread]);
    }] integerValue];
}

@end

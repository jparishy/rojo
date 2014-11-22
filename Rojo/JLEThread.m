//
//  JLEThread.m
//  Rojo
//
//  Created by Julius Parishy on 11/21/14.
//  Copyright (c) 2014 Julius Parishy. All rights reserved.
//

#import "JLEThread.h"

@implementation JLEThread

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
        @"threadID" : @"id",
        @"subredditID" : @"subreddit_id",
        
        @"timestamp" : @"created_utc",

        @"title" : @"title",
        @"text" : @"selftext",
        @"authorUsername" : @"author",

        @"score" : @"score",
        @"numberOfUpvotes" : @"ups",
        @"numberOfDownvotes" : @"downs",
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

@end

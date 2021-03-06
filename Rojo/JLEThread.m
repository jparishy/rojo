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
        @"threadID" : @"data.id",
        @"subredditID" : @"data.subreddit_id",
        
        @"timestamp" : @"data.created_utc",

        @"title" : @"data.title",
        @"text" : @"data.selftext",
        @"authorUsername" : @"data.author",

        @"score" : @"data.score",
        @"numberOfUpvotes" : @"data.ups",
        @"numberOfDownvotes" : @"data.downs",
        
        @"permalink" : @"data.permalink"
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

- (NSString *)APIPath
{
    return self.permalink;
}

@end

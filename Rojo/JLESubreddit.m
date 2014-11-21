//
//  JLESubreddit.m
//  Rojo
//
//  Created by Julius Parishy on 11/16/14.
//  Copyright (c) 2014 Julius Parishy. All rights reserved.
//

#import "JLESubreddit.h"

@implementation JLESubreddit

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
    
        @"identifier" : @"id",

        @"title" : @"title",
        @"displayName" : @"display_name",

        @"headerImageURL" : @"header_img",
        @"headerTitle" : @"header_title",

        @"descriptionMarkdown" : @"description",

        @"numberOfSubscribers" : @"subscribers"
    };
}

- (NSString *)name
{
    return [NSString stringWithFormat:@"r/%@", self.displayName];
}

@end

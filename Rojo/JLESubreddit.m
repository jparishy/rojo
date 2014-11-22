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
    
        @"identifier" : @"data.id",

        @"title" : @"data.title",
        @"displayName" : @"data.display_name",

        @"headerImageURL" : @"data.header_img",
        @"headerTitle" : @"data.header_title",

        @"descriptionMarkdown" : @"data.description",

        @"numberOfSubscribers" : @"data.subscribers"
    };
}

- (NSString *)name
{
    return [NSString stringWithFormat:@"r/%@", self.displayName];
}

- (NSString *)APIPath
{
    return [NSString stringWithFormat:@"r/%@", self.displayName];
}

@end

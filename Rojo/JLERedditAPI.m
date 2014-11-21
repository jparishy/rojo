//
//  JLERedditAPI.m
//  Rojo
//
//  Created by Julius Parishy on 11/16/14.
//  Copyright (c) 2014 Julius Parishy. All rights reserved.
//

#import "JLERedditAPI.h"

@interface JLERedditAPI ()
@end

@implementation JLERedditAPI

- (instancetype)initWithClient:(JLERedditClient *)client
{
    if((self = [super init]))
    {
        _client = client;
    }
    
    return self;
}

@end

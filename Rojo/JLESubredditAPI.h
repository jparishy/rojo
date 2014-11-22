//
//  JLESubredditAPI.h
//  Rojo
//
//  Created by Julius Parishy on 11/21/14.
//  Copyright (c) 2014 Julius Parishy. All rights reserved.
//

#import "JLERedditAPI.h"

@class JLESubreddit;
@class JLEThread;

@interface JLESubredditAPI : JLERedditAPI

@property (nonatomic, strong, readonly) JLESubreddit *subreddit;

- (instancetype)initWithClient:(JLERedditClient *)client subreddit:(JLESubreddit *)subreddit;

- (AFHTTPRequestOperation *)requestThreadsWithSuccess:(void(^)(NSArray *threads))success failure:(void(^)(NSError *error))failure;
- (AFHTTPRequestOperation *)requestThreadsBeforeThread:(JLEThread *)thread success:(void(^)(NSArray *threads))success failure:(void(^)(NSError *error))failure;
- (AFHTTPRequestOperation *)requestThreadsAfterThread:(JLEThread *)thread success:(void(^)(NSArray *threads))success failure:(void(^)(NSError *error))failure;

@end

//
//  JLEThreadAPI.h
//  Rojo
//
//  Created by Julius Parishy on 11/21/14.
//  Copyright (c) 2014 Julius Parishy. All rights reserved.
//

#import "JLERedditAPI.h"

@class JLERedditClient;
@class JLEThread;

@interface JLEThreadAPI : JLERedditAPI

@property (nonatomic, strong, readonly) JLEThread *thread;

- (instancetype)initWithClient:(JLERedditClient *)client thread:(JLEThread *)thread;

- (AFHTTPRequestOperation *)requestCommentsWithSuccess:(void(^)(NSArray *comments))success failure:(void(^)(NSError *error))failure;

@end

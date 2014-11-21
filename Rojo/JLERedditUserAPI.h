//
//  JLERedditUserAPI.h
//  Rojo
//
//  Created by Julius Parishy on 11/16/14.
//  Copyright (c) 2014 Julius Parishy. All rights reserved.
//

#import "JLERedditAPI.h"

@interface JLERedditUserAPI : JLERedditAPI

- (AFHTTPRequestOperation *)listSubredditsWithSuccess:(void(^)(NSArray *subreddits))success failure:(void(^)(NSError *error))failure;

@end

//
//  JLERedditUserAPI.m
//  Rojo
//
//  Created by Julius Parishy on 11/16/14.
//  Copyright (c) 2014 Julius Parishy. All rights reserved.
//

#import "JLERedditUserAPI.h"

#import "JLESubreddit.h"

#import <BlocksKit/BlocksKit.h>
#import <EXTScope.h>

@implementation JLERedditUserAPI

- (NSArray *)transformSubredditJSONDictionaries:(NSArray *)JSONDictionaries error:(NSError **)error
{
    NSMutableArray *subreddits = [[NSMutableArray alloc] init];
    
    NSError *deserializationError = nil;
    
    for(NSDictionary *JSONDictionary in JSONDictionaries)
    {
        Class klass = [JLESubreddit class];
        JLESubreddit *subreddit = [MTLJSONAdapter modelOfClass:klass fromJSONDictionary:JSONDictionary error:&deserializationError];
        
        if(subreddit == nil)
        {
            break;
        }
        
        [subreddits addObject:subreddit];
    }
    
    if(deserializationError != nil && error != NULL)
    {
        *error = deserializationError;
        return nil;
    }
    
    return [subreddits copy];
}

- (AFHTTPRequestOperation *)listSubredditsWithSuccess:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure
{
    NSParameterAssert(success);
    NSParameterAssert(failure);
    
    NSString *path = @"subreddits/";
    
    @weakify(self);
    AFHTTPRequestOperation *operation = [self.client GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            @strongify(self);
            
            NSDictionary *response = responseObject;
            NSDictionary *data = response[@"data"];
            
            NSArray *subredditJSONDictionaries = [data[@"children"] bk_map:^id(NSDictionary *containerDictionary) {
                
                return containerDictionary[@"data"];
            }];
            
            NSError *error = nil;
            NSArray *subreddits = [self transformSubredditJSONDictionaries:subredditJSONDictionaries error:&error];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                if(subreddits == nil)
                {
                    failure(error);
                }
                else
                {
                    success(subreddits);
                }
            });
        });
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        failure(error);
    }];
    
    return operation;
}

@end

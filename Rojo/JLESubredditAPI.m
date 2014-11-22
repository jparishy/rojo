//
//  JLESubredditAPI.m
//  Rojo
//
//  Created by Julius Parishy on 11/21/14.
//  Copyright (c) 2014 Julius Parishy. All rights reserved.
//

#import "JLESubredditAPI.h"

#import "JLESubreddit.h"
#import "JLEThread.h"

@implementation JLESubredditAPI

- (instancetype)initWithClient:(JLERedditClient *)client subreddit:(JLESubreddit *)subreddit
{
    if((self = [super initWithClient:client]))
    {
        _subreddit = subreddit;
    }
    
    return self;
}

- (AFHTTPRequestOperation *)requestThreadsWithSuccess:(void(^)(NSArray *threads))success failure:(void(^)(NSError *error))failure
{
    NSCParameterAssert(success);
    NSCParameterAssert(failure);
    
    NSString *path = [self.subreddit APIPath];
    
    @weakify(self);
    return [self.client GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            @strongify(self);
            
            NSDictionary *response = responseObject;
            NSDictionary *data = response[@"data"];
            
            NSArray *threadsJSONDictionaries = [data[@"children"] bk_map:^id(NSDictionary *containerDictionary) {
                
                return containerDictionary[@"data"];
            }];
            
            NSError *error = nil;
            NSArray *threads = [self transformObjectJSONDictionaries:threadsJSONDictionaries class:[JLEThread class] error:&error];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                if(threads == nil)
                {
                    failure(error);
                }
                else
                {
                    success(threads);
                }
            });
        });
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        failure(error);
    }];
}

- (AFHTTPRequestOperation *)requestThreadsBeforeThread:(JLEThread *)thread success:(void(^)(NSArray *threads))success failure:(void(^)(NSError *error))failure
{
    NSCParameterAssert(thread);
    NSCParameterAssert(success);
    NSCParameterAssert(failure);
    
    NSCParameterAssert(success);
    NSCParameterAssert(failure);
    
    NSString *path = [self.subreddit APIPath];

    NSDictionary *parameters = @{
        @"before" : thread.threadID
    };
    
    @weakify(self);
    return [self.client GET:path parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            @strongify(self);
            
            NSDictionary *response = responseObject;
            NSDictionary *data = response[@"data"];
            
            NSArray *threadsJSONDictionaries = [data[@"children"] bk_map:^id(NSDictionary *containerDictionary) {
                
                return containerDictionary[@"data"];
            }];
            
            NSError *error = nil;
            NSArray *threads = [self transformObjectJSONDictionaries:threadsJSONDictionaries class:[JLEThread class] error:&error];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                if(threads == nil)
                {
                    failure(error);
                }
                else
                {
                    success(threads);
                }
            });
        });
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        failure(error);
    }];
}

- (AFHTTPRequestOperation *)requestThreadsAfterThread:(JLEThread *)thread success:(void(^)(NSArray *threads))success failure:(void(^)(NSError *error))failure
{
    NSCParameterAssert(thread);
    NSCParameterAssert(success);
    NSCParameterAssert(failure);
    
    NSCParameterAssert(success);
    NSCParameterAssert(failure);
    
    NSString *path = [self.subreddit APIPath];
    
    NSDictionary *parameters = @{
        @"after" : thread.threadID
    };
    
    @weakify(self);
    return [self.client GET:path parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            @strongify(self);
            
            NSDictionary *response = responseObject;
            NSDictionary *data = response[@"data"];
            
            NSArray *threadsJSONDictionaries = [data[@"children"] bk_map:^id(NSDictionary *containerDictionary) {
                
                return containerDictionary[@"data"];
            }];
            
            NSError *error = nil;
            NSArray *threads = [self transformObjectJSONDictionaries:threadsJSONDictionaries class:[JLEThread class] error:&error];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                if(threads == nil)
                {
                    failure(error);
                }
                else
                {
                    success(threads);
                }
            });
        });
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        failure(error);
    }];
}

@end

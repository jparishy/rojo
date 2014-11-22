//
//  JLERedditUserAPI.m
//  Rojo
//
//  Created by Julius Parishy on 11/16/14.
//  Copyright (c) 2014 Julius Parishy. All rights reserved.
//

#import "JLEUserAPI.h"

#import "JLESubreddit.h"

#import <BlocksKit/BlocksKit.h>
#import <EXTScope.h>

@implementation JLEUserAPI

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
            NSArray *subredditJSONDictionaries = data[@"children"];
            
            NSError *error = nil;
            NSArray *subreddits = [self transformObjectJSONDictionaries:subredditJSONDictionaries class:[JLESubreddit class] error:&error];
            
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

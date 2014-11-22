//
//  JLEThreadAPI.m
//  Rojo
//
//  Created by Julius Parishy on 11/21/14.
//  Copyright (c) 2014 Julius Parishy. All rights reserved.
//

#import "JLEThreadAPI.h"

#import "JLERedditClient.h"

#import "JLEThread.h"
#import "JLEComment.h"
#import "JLEComment+Private.h"

@implementation JLEThreadAPI

- (instancetype)initWithClient:(JLERedditClient *)client thread:(JLEThread *)thread
{
    if((self = [super initWithClient:client]))
    {
        _thread = thread;
    }
    
    return self;
}

- (AFHTTPRequestOperation *)requestCommentsWithSuccess:(void(^)(NSArray *comments))success failure:(void(^)(NSError *error))failure
{
    NSCParameterAssert(success);
    NSCParameterAssert(failure);
    
    NSString *path = [self.thread APIPath];
    
    @weakify(self);
    return [self.client GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            @strongify(self);
            
            NSArray *response = responseObject;
            NSDictionary *commentsJSON = response[1];
            NSDictionary *data = commentsJSON[@"data"];
            NSArray *commentsJSONDictionaries = data[@"children"];
            
            NSError *error = nil;
            NSArray *comments = [self transformObjectJSONDictionaries:commentsJSONDictionaries class:[JLEComment class] error:&error];
            
            for(JLEComment *comment in comments)
            {
                [comment _postProcess];
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                if(comments == nil)
                {
                    failure(error);
                }
                else
                {
                    success(comments);
                }
            });
        });
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        failure(error);
    }];
}

@end

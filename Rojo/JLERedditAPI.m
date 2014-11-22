//
//  JLERedditAPI.m
//  Rojo
//
//  Created by Julius Parishy on 11/16/14.
//  Copyright (c) 2014 Julius Parishy. All rights reserved.
//

#import "JLERedditAPI.h"

#import <Mantle/Mantle.h>

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

- (NSArray *)transformObjectJSONDictionaries:(NSArray *)JSONDictionaries class:(Class)klass error:(NSError **)error
{
    NSMutableArray *objects = [[NSMutableArray alloc] init];
    
    NSError *deserializationError = nil;
    
    for(NSDictionary *JSONDictionary in JSONDictionaries)
    {
        id object = [MTLJSONAdapter modelOfClass:klass fromJSONDictionary:JSONDictionary error:&deserializationError];
        
        if(object == nil)
        {
            break;
        }
        
        [objects addObject:object];
    }
    
    if(deserializationError != nil && error != NULL)
    {
        *error = deserializationError;
        return nil;
    }
    
    return [objects copy];
}

@end

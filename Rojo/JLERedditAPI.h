//
//  JLERedditAPI.h
//  Rojo
//
//  Created by Julius Parishy on 11/16/14.
//  Copyright (c) 2014 Julius Parishy. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "JLERedditClient.h"

@interface JLERedditAPI : NSObject

@property (nonatomic, weak, readonly) JLERedditClient *client;

- (instancetype)initWithClient:(JLERedditClient *)client;

- (NSArray *)transformObjectJSONDictionaries:(NSArray *)JSONDictionaries class:(Class)klass error:(NSError **)error;

@end

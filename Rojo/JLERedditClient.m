//
//  JLERedditClient.m
//  Rojo
//
//  Created by Julius Parishy on 11/16/14.
//  Copyright (c) 2014 Julius Parishy. All rights reserved.
//

#import "JLERedditClient.h"

@implementation JLERedditClient

- (instancetype)init
{
    NSString *path = @"https://api.reddit.com/";
    NSURL *baseURL = [NSURL URLWithString:path];
    
    NSString *authorizationPath = @"https://ssl.reddit.com/api/v1/authorize.compact";
    NSURL *authorizationURL = [NSURL URLWithString:authorizationPath];
    
    NSString *redirectPath = @"rojo://redirect";
    NSURL *redirectURL = [NSURL URLWithString:redirectPath];
    
    NSString *clientID = @"8qOC3EiAM1gdvg";
    
    JLEOAuth2AuthorizationParameters *authorizationParameters = [[JLEOAuth2AuthorizationParameters alloc] init];
    
    authorizationParameters.clientID = clientID;
    authorizationParameters.authorizationURL = authorizationURL;
    authorizationParameters.responseType = @"code";
    authorizationParameters.scopes = @[ @"mysubreddits" ];
    authorizationParameters.duration = @"permanent";
    authorizationParameters.redirectURL = redirectURL;
    
    NSString *accessTokenPath = @"https://ssl.reddit.com/api/v1/access_token";
    authorizationParameters.accessTokenURL = [NSURL URLWithString:accessTokenPath];
    
    NSString *name = @"reddit";
    
    if((self = [super initWithBaseURL:baseURL name:name authorizationParameters:authorizationParameters]))
    {
    }
    
    return self;
}

@end

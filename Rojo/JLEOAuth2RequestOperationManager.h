//
//  JLEOAuth2RequestOperationManager.h
//  Rojo
//
//  Created by Julius Parishy on 11/18/14.
//  Copyright (c) 2014 Julius Parishy. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@class JLEOAuth2Credentials;

typedef void(^JLEOAuth2PresentViewControllerBlock)(UIViewController *viewController);

@interface JLEOAuth2AuthorizationParameters : NSObject

@property (nonatomic, copy) NSString *clientID;
@property (nonatomic, copy) NSString *responseType;

@property (nonatomic, strong) NSURL *authorizationURL;
@property (nonatomic, strong) NSURL *redirectURL;
@property (nonatomic, strong) NSURL *accessTokenURL;

@property (nonatomic, copy) NSString *duration;
@property (nonatomic, copy) NSArray *scopes;

@end

@interface JLEOAuth2RequestOperationManager : AFHTTPRequestOperationManager

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, strong, readonly) JLEOAuth2Credentials *credentials;

@property (nonatomic, copy) JLEOAuth2PresentViewControllerBlock presentViewController;

- (instancetype)initWithBaseURL:(NSURL *)url name:(NSString *)name authorizationParameters:(JLEOAuth2AuthorizationParameters *)authorizationParameters;

- (void)authorizeWithSuccess:(void(^)(JLEOAuth2Credentials *credentials))success failure:(void(^)(NSError *error))failure;

- (BOOL)isAuthorized;

@end

@interface JLEOAuth2Credentials : NSObject<NSCoding>

@property (nonatomic, copy) NSString *accessToken;
@property (nonatomic, copy) NSString *refreshToken;

@end


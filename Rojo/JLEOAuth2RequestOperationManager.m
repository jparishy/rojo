//
//  JLEOAuth2RequestOperationManager.m
//  Rojo
//
//  Created by Julius Parishy on 11/18/14.
//  Copyright (c) 2014 Julius Parishy. All rights reserved.
//

#import "JLEOAuth2RequestOperationManager.h"

#import "UIView+LECommonLayoutConstraints.h"

@implementation JLEOAuth2AuthorizationParameters

- (NSURL *)userAuthorizationURL
{
    NSString *path = self.authorizationURL.absoluteString;
    
    path = [self stringByAppendingString:path withGETParameterWithKey:@"client_id" value:self.clientID];
    path = [self stringByAppendingString:path withGETParameterWithKey:@"response_type" value:self.responseType];
    
    NSString *redirectURI = self.redirectURL.absoluteString;
    path = [self stringByAppendingString:path withGETParameterWithKey:@"redirect_uri" value:redirectURI];
    
    path = [self stringByAppendingString:path withGETParameterWithKey:@"duration" value:self.duration];
    
    NSString *scopes = [self.scopes componentsJoinedByString:@","];
    path = [self stringByAppendingString:path withGETParameterWithKey:@"scope" value:scopes];
    
    NSString *state = [[NSUUID UUID] UUIDString];
    path = [self stringByAppendingString:path withGETParameterWithKey:@"state" value:state];
    
    return [NSURL URLWithString:path];
}

- (NSString *)stringByAppendingString:(NSString *)string withGETParameterWithKey:(NSString *)key value:(NSString *)value
{
    NSString *base = [string copy];
    if([base rangeOfString:@"?"].location == NSNotFound)
    {
        base = [base stringByAppendingString:@"?"];
    }
    else
    {
        base = [base stringByAppendingString:@"&"];
    }
    
    NSString *parameter = [NSString stringWithFormat:@"%@=%@", key, value];
    return [base stringByAppendingString:parameter];
}

@end

@implementation JLEOAuth2Credentials

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if((self = [super init]))
    {
    
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<JLEOAuth2Credentials:%p: accessToken=\'%@\' refreshToken=\'%@\'>", self, self.accessToken, self.refreshToken];
}

@end

@interface JLEOAuth2WebViewController : UIViewController<UIWebViewDelegate>

@property (nonatomic, strong, readonly) NSURL *url;
@property (nonatomic, strong, readonly) UIWebView *webView;

@property (nonatomic, copy) void(^obtainedAccessTokenCode)(NSString *code);

- (instancetype)initWithURL:(NSURL *)url;

@end

@implementation JLEOAuth2WebViewController

- (instancetype)initWithURL:(NSURL *)url
{
    if((self = [super init]))
    {
        _url = url;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"Authorize", nil);
    
    [self initializeWebView];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:self.url];
    [self.webView loadRequest:request];
}

- (void)initializeWebView
{
    _webView = [[UIWebView alloc] init];
    self.webView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:self.webView];
    [self.view le_addContraintsForFilledView:self.webView insets:UIEdgeInsetsZero];
    
    self.webView.delegate = self;
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSURL *url = request.URL;
    NSString *code = [self codeFromURL:url];
    
    if(code != nil)
    {
        if(self.obtainedAccessTokenCode)
        {
            self.obtainedAccessTokenCode(code);
        }
        
        return NO;
    }
    
    return YES;
}

- (NSString *)codeFromURL:(NSURL *)url
{
    NSString *query = [url query];
    NSArray *parameters = [query componentsSeparatedByString:@"&"];
    
    for(NSString *parameter in parameters)
    {
        NSArray *keyAndValue = [parameter componentsSeparatedByString:@"="];
        if(keyAndValue.count != 2)
        {
            continue;
        }
        
        NSString *key = keyAndValue[0];
        NSString *value = keyAndValue[1];
        
        if([key isEqualToString:@"code"])
        {
            return value;
        }
    }
    
    return nil;
}

@end

@interface JLEOAuth2RequestOperationManager ()

@property (nonatomic, strong) JLEOAuth2AuthorizationParameters *authorizationParameters;

@end

@implementation JLEOAuth2RequestOperationManager

- (instancetype)initWithBaseURL:(NSURL *)url authorizationParameters:(JLEOAuth2AuthorizationParameters *)authorizationParameters
{
    NSParameterAssert(authorizationParameters);
    
    if((self = [super initWithBaseURL:url]))
    {
        _authorizationParameters = authorizationParameters;
    }
    
    return self;
}

- (void)authorizeWithSuccess:(void (^)(JLEOAuth2Credentials *))success failure:(void (^)(NSError *))failure
{
    NSCParameterAssert(success);
    NSCParameterAssert(failure);
    
    NSCAssert(self.presentViewController, @"Must set presentViewController block.");
    
    NSURL *url = [self.authorizationParameters userAuthorizationURL];
    JLEOAuth2WebViewController *viewController = [[JLEOAuth2WebViewController alloc] initWithURL:url];
    
    @weakify(self);
    @weakify(viewController);
    viewController.obtainedAccessTokenCode = ^(NSString *code) {
        
        @strongify(self);
        @strongify(viewController);
        NSLog(@"Got code: %@", code);
        
        [viewController dismissViewControllerAnimated:YES completion:nil];
        
        [self requestAccessTokenWithCode:code success:^(JLEOAuth2Credentials *credentials) {
            
            success(credentials);
            
        } failure:^(NSError *error) {
            
            failure(error);
        }];
    };
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    self.presentViewController(navigationController);
}

- (void)requestAccessTokenWithCode:(NSString *)code success:(void (^)(JLEOAuth2Credentials *))success failure:(void (^)(NSError *))failure
{
    NSCParameterAssert(code);
    NSCParameterAssert(success);
    NSCParameterAssert(failure);
    
    NSString *path = self.authorizationParameters.accessTokenURL.absoluteString;
    NSString *redirectURI = self.authorizationParameters.redirectURL.absoluteString;
    
    NSDictionary *parameters = @{
        @"grant_type" : @"authorization_code",
        @"code" : code,
        @"redirect_uri" : redirectURI
    };
    
    NSString *username = self.authorizationParameters.clientID;
    NSString *password = @"";
    
    [self.requestSerializer setAuthorizationHeaderFieldWithUsername:username password:password];
    
    [self POST:path parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        JLEOAuth2Credentials *credentials = [[JLEOAuth2Credentials alloc] init];
        credentials.accessToken = responseObject[@"access_token"];
        credentials.refreshToken = responseObject[@"refresh_token"];
        
        success(credentials);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        failure(error);
    }];
}

@end



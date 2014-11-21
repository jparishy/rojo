//
//  JLEFrontpageViewController.m
//  Rojo
//
//  Created by Julius Parishy on 11/16/14.
//  Copyright (c) 2014 Julius Parishy. All rights reserved.
//

#import "JLEFrontpageViewController.h"

#import "JLERedditClient.h"
#import "JLERedditUserAPI.h"

#import "JLESubreddit.h"

#import "JLESubredditListViewController.h"
#import "JLESubredditViewController.h"

#import "UIView+LECommonLayoutConstraints.h"

@interface JLEFrontpageViewController () <JLESubredditListViewControllerDelegate>

@property (nonatomic, strong) JLERedditClient *client;
@property (nonatomic, strong) JLERedditUserAPI *userAPI;

@property (nonatomic, strong) JLETheme *currentTheme;

@property (nonatomic, strong) JLESubredditListViewController *subredditListViewController;

@end

@implementation JLEFrontpageViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.client = [[JLERedditClient alloc] init];
    
    @weakify(self);
    self.client.presentViewController = ^(UIViewController *viewController) {
        
        @strongify(self);
        [self.navigationController presentViewController:viewController animated:YES completion:nil];
    };
    
    self.userAPI = [[JLERedditUserAPI alloc] initWithClient:self.client];
    
    self.currentTheme = [[JLETheme alloc] init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"Rojo", nil);
    
    [self configureNavigationBar];
    [self initializeSubredditListViewController];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.client authorizeWithSuccess:^(JLEOAuth2Credentials *credentials) {
        
        NSLog(@"Authorized!");
        
    } failure:^(NSError *error) {
        
    }];
    
    if(self.subredditListViewController.subreddits.count == 0)
    {
        [self refreshSubredditsList];
    }
}

#pragma mark - View intitialization

- (void)initializeSubredditListViewController
{
    self.subredditListViewController = [[JLESubredditListViewController alloc] init];
    [self addChildViewController:self.subredditListViewController];
    
    UIView *view = self.subredditListViewController.view;
    view.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:view];
    [self.view le_addContraintsForFilledView:view insets:UIEdgeInsetsZero];
    
    self.subredditListViewController.delegate = self;
    self.subredditListViewController.theme = self.currentTheme;
}

- (void)configureNavigationBar
{
    JLERojoNavigationBar *navigationBar = (JLERojoNavigationBar *) self.navigationController.navigationBar;
    navigationBar.theme = self.currentTheme;
}

#pragma mark - Interactions

- (void)refreshSubredditsList
{
    @weakify(self);
    [self.userAPI listSubredditsWithSuccess:^(NSArray *subreddits) {
        
        @strongify(self);
        self.subredditListViewController.subreddits = subreddits;
        
    } failure:^(NSError *error) {
        
        NSLog(@"%@", error);
    }];
}

- (void)presentSubredditViewControllerForSubreddit:(JLESubreddit *)subreddit
{
    JLESubredditViewController *viewController = [[JLESubredditViewController alloc] init];
    viewController.subreddit = subreddit;
    
    [self.navigationController pushViewController:viewController animated:YES];
}

#pragma mark - JLESubredditListViewControllerDelegate

- (void)subredditListViewController:(JLESubredditListViewController *)viewController didSelectSubreddit:(JLESubreddit *)subreddit
{
    [self presentSubredditViewControllerForSubreddit:subreddit];
}

@end

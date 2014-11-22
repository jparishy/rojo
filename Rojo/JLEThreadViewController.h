//
//  JLEThreadViewController.h
//  Rojo
//
//  Created by Julius Parishy on 11/21/14.
//  Copyright (c) 2014 Julius Parishy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JLERedditClient;
@class JLEThread;

@interface JLEThreadViewController : UIViewController

@property (nonatomic, weak) JLETheme *theme;
@property (nonatomic, strong) JLERedditClient *client;
@property (nonatomic, strong) JLEThread *thread;

@end

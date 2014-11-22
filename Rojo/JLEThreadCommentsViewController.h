//
//  JLEThreadCommentsViewController.h
//  Rojo
//
//  Created by Julius Parishy on 11/21/14.
//  Copyright (c) 2014 Julius Parishy. All rights reserved.
//

#import "JLEPagingTableController.h"

@class JLEThreadAPI;

@interface JLEThreadCommentsViewController : UIViewController

@property (nonatomic, weak) JLETheme *theme;
@property (nonatomic, strong) JLEThreadAPI *api;

@end

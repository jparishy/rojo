//
//  UITableViewCell+JLEDefaultReuseIdentifier.h
//  Rojo
//
//  Created by Julius Parishy on 11/18/14.
//  Copyright (c) 2014 Julius Parishy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (JLEDefaultReuseIdentifier)

+ (NSString *)jle_defaultReuseIdentifier;

+ (BOOL)jle_registerNibWithNibName:(NSString *)nibName bundle:(NSBundle *)bundle inTableView:(UITableView *)tableView;
+ (BOOL)jle_registerNibInTableView:(UITableView *)tableView;

+ (void)jle_registerClassInTableView:(UITableView *)tableView;

@end

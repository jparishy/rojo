//
//  UITableViewCell+JLEDefaultReuseIdentifier.m
//  Rojo
//
//  Created by Julius Parishy on 11/18/14.
//  Copyright (c) 2014 Julius Parishy. All rights reserved.
//

#import "UITableViewCell+JLEDefaultReuseIdentifier.h"

@implementation UITableViewCell (JLEDefaultReuseIdentifier)

+ (NSString *)jle_defaultReuseIdentifier
{
    return NSStringFromClass(self);
}

+ (BOOL)jle_registerNibWithNibName:(NSString *)nibName bundle:(NSBundle *)bundle inTableView:(UITableView *)tableView
{
    NSParameterAssert(nibName);
    NSParameterAssert(tableView);
    
    UINib *nib = [UINib nibWithNibName:nibName bundle:bundle];
    if(nib == nil)
    {
        return NO;
    }
    
    NSString *identifier = [self jle_defaultReuseIdentifier];
    [tableView registerNib:nib forCellReuseIdentifier:identifier];
    
    return YES;
}

+ (BOOL)jle_registerNibInTableView:(UITableView *)tableView
{
    NSString *nibName = NSStringFromClass(self);
    return [self jle_registerNibWithNibName:nibName bundle:nil inTableView:tableView];
}

+ (void)jle_registerClassInTableView:(UITableView *)tableView
{
    NSString *identifier = [self jle_defaultReuseIdentifier];
    [tableView registerClass:self forCellReuseIdentifier:identifier];
}

@end

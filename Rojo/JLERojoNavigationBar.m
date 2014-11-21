//
//  JLERojoNavigationBar.m
//  Rojo
//
//  Created by Julius Parishy on 11/18/14.
//  Copyright (c) 2014 Julius Parishy. All rights reserved.
//

#import "JLERojoNavigationBar.h"

@implementation JLERojoNavigationBar

- (void)setTheme:(JLETheme *)theme
{
    _theme = theme;
    
    self.titleTextAttributes = [self.class titleTextAttributesForTheme:theme];
    self.tintColor = [theme highlightedBackgroundColor];
}

+ (NSDictionary *)titleTextAttributesForTheme:(JLETheme *)theme
{
    return @{
        NSForegroundColorAttributeName : theme.highlightedTextColor
    };
}

@end

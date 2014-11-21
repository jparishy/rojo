//
//  JLERojoNavigationBar.h
//  Rojo
//
//  Created by Julius Parishy on 11/18/14.
//  Copyright (c) 2014 Julius Parishy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JLERojoNavigationBar : UINavigationBar

@property (nonatomic, weak) JLETheme *theme;

+ (NSDictionary *)titleTextAttributesForTheme:(JLETheme *)theme;

@end

//
//  JLETheme.m
//  Rojo
//
//  Created by Julius Parishy on 11/18/14.
//  Copyright (c) 2014 Julius Parishy. All rights reserved.
//

#import "JLETheme.h"

@implementation JLETheme

- (UIColor *)highlightedTextColor
{
    return JLEUIColorRGB(192, 70, 24);
}

- (UIColor *)highlightedBackgroundColor
{
    return JLEUIColorRGB(255, 139, 96);
}

@end

UIColor *JLEUIColorRGB(uint8_t r, uint8_t g, uint8_t b)
{
    return JLEUIColorRGBA(r, g, b, 255);
}

UIColor *JLEUIColorRGBA(uint8_t r, uint8_t g, uint8_t b, uint8_t a)
{
    CGFloat fr = (CGFloat)r / 255.0f;
    CGFloat fg = (CGFloat)g / 255.0f;
    CGFloat fb = (CGFloat)b / 255.0f;
    CGFloat fa = (CGFloat)a / 255.0f;
    
    return [UIColor colorWithRed:fr green:fg blue:fb alpha:fa];
}
//
//  JLETheme.h
//  Rojo
//
//  Created by Julius Parishy on 11/18/14.
//  Copyright (c) 2014 Julius Parishy. All rights reserved.
//

#import <UIKit/UIKit.h>

extern UIColor *JLEUIColorRGB(uint8_t r, uint8_t g, uint8_t b);
extern UIColor *JLEUIColorRGBA(uint8_t r, uint8_t g, uint8_t b, uint8_t a);

@interface JLETheme : NSObject

- (UIColor *)highlightedTextColor;
- (UIColor *)highlightedBackgroundColor;

@end

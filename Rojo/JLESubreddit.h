//
//  JLESubreddit.h
//  Rojo
//
//  Created by Julius Parishy on 11/16/14.
//  Copyright (c) 2014 Julius Parishy. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface JLESubreddit : MTLModel<MTLJSONSerializing>

@property (nonatomic, copy) NSString *identifier;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *displayName;

@property (nonatomic, strong) NSURL *headerImageURL;
@property (nonatomic, copy) NSString *headerTitle;

@property (nonatomic, copy) NSString *descriptionMarkdown;

@property (nonatomic, assign) NSInteger numberOfSubscribers;

- (NSString *)name;

@end

//
//  JLESubreddit.h
//  Rojo
//
//  Created by Julius Parishy on 11/16/14.
//  Copyright (c) 2014 Julius Parishy. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface JLESubreddit : MTLModel<MTLJSONSerializing>

@property (nonatomic, copy, readonly) NSString *identifier;

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *displayName;

@property (nonatomic, strong, readonly) NSURL *headerImageURL;
@property (nonatomic, copy, readonly) NSString *headerTitle;

@property (nonatomic, copy, readonly) NSString *descriptionMarkdown;

@property (nonatomic, assign, readonly) NSInteger numberOfSubscribers;

- (NSString *)name;
- (NSString *)APIPath;

@end

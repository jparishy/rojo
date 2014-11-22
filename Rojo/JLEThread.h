//
//  JLEThread.h
//  Rojo
//
//  Created by Julius Parishy on 11/21/14.
//  Copyright (c) 2014 Julius Parishy. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface JLEThread : MTLModel<MTLJSONSerializing>

@property (nonatomic, copy, readonly) NSString *threadID;
@property (nonatomic, copy, readonly) NSString *subredditID;

@property (nonatomic, strong, readonly) NSDate *timestamp;

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *text;
@property (nonatomic, copy, readonly) NSString *authorUsername;

@property (nonatomic, assign, readonly) NSInteger score;
@property (nonatomic, assign, readonly) NSInteger numberOfUpvotes;
@property (nonatomic, assign, readonly) NSInteger numberOfDownvotes;

@end

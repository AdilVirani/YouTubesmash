//
//  AKPlaylistYouTubeObject.h
//  AKYouTubeExample
//
//  Created by Adil  Virani on 4/9/15.
//  Copyright (c) 2015 Adil  Virani. All rights reserved.
//

#import "AKBaseYouTubeObject.h"

@interface AKPlaylistYouTubeObject : AKBaseYouTubeObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *channelId;
@property (nonatomic, copy) NSString *itemDescription;
@property (nonatomic, copy) NSString *channelTitle;
@property (nonatomic, copy) NSString *defaultUrl;
@property (nonatomic, copy) NSString *mediumUrl;
@property (nonatomic, copy) NSString *highUrl;
@property (nonatomic, copy) NSString *itemId;
@property (nonatomic, strong) NSDate *publishedAt;

@end

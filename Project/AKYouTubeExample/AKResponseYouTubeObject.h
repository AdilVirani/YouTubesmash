//
//  AKResponseYouTubeObject.h
//  AKYouTubeExample
//
//  Created by Adil  Virani on 4/9/15.
//  Copyright (c) 2015 Adil  Virani. All rights reserved.
//

#import "AKBaseYouTubeObject.h"

@interface AKResponseYouTubeObject : AKBaseYouTubeObject

@property (nonatomic, strong) NSArray *items;
@property (nonatomic, assign) NSUInteger totalResults;
@property (nonatomic, assign) NSUInteger resultsPerPage;

@end

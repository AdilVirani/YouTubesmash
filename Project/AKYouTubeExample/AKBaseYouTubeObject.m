//
//  AKBaseYouTubeObject.m
//  AKYouTubeExample
//
//  Created by Adil  Virani on 4/9/15.
//  Copyright (c) 2015 Adil  Virani. All rights reserved.
//

#import "AKBaseYouTubeObject.h"

@implementation AKBaseYouTubeObject

- (NSString *)description {
    return [NSString stringWithFormat:@"Object kind is: %@, etag: %@", self.kind, self.etag];
}

@end

//
//  NSData+AKRest.h
//  AKYouTube
//
//  Created by Adil  Virani on 4/9/15.
//  Copyright (c) 2015 Adil  Virani. All rights reserved.
//

@import Foundation;

#define TIMEOUT_INTERVAL 30.0f

@interface NSData (AKRest)

+ (NSData *)dataUseMethodGetWithStringUrl:(NSString *)stringUrl
                             httpResponse:(NSHTTPURLResponse **)response
                                    error:(NSError **)error;
+ (NSData *)dataUseMethodGetWithURL:(NSURL *)url
                       httpResponse:(NSHTTPURLResponse **)response
                              error:(NSError **)error;

+ (NSData *)dataUseMethod:(NSString *)method
            withStringUrl:(NSString *)stringUrl
           withParameters:(NSDictionary *)parameters
             httpResponse:(NSHTTPURLResponse **)response
                    error:(NSError **)error;
+ (NSData *)dataUseMethod:(NSString *)method
                  withURL:(NSURL *)url
           withParameters:(NSDictionary *)parameters
             httpResponse:(NSHTTPURLResponse **)response
                    error:(NSError **)error;

@end

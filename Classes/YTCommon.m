//
//  YTCommon.m
//  AKYouTubeExample
//
//  Created by Adil  Virani on 4/9/15.
//  Copyright (c) 2015 Adil  Virani. All rights reserved.
//

#import "YTCommon.h"
#import "NSData+AKRest.h"

@implementation YTCommon

+ (NSString *)makeOptionsListFromOptions:(NSDictionary *)options {
    __block NSMutableArray *optionsArray = [NSMutableArray array];
    
    [options enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [optionsArray addObject:[NSString stringWithFormat:@"%@=%@", key, obj]];
    }];
    
    return [optionsArray componentsJoinedByString:@"&"];
}
+ (NSData *)dataAnswerForRequestMethod:(YTRestMethod)method
                         withUrlString:(NSString *)urlString
                        withParameters:(NSDictionary *)parameters
                              response:(NSHTTPURLResponse **)response
                                 error:(NSError **)error {
    NSString *methodString;
    switch (method) {
        case AKRestMethodGet:
            methodString = @"GET";
            break;
        case AKRestMethodPost:
            methodString = @"POST";
            break;
            
        default:
            break;
    }
    
    NSData *data = [NSData dataUseMethod:methodString
                           withStringUrl:urlString
                          withParameters:parameters
                            httpResponse:response
                                   error:error];
    
    return data;
}
+ (NSDictionary *)jsonAnswerForRequestMethod:(YTRestMethod)method
                               withUrlString:(NSString *)urlString
                              withParameters:(NSDictionary *)parameters
                                    response:(NSHTTPURLResponse **)response
                                       error:(NSError **)error {
    NSData *data = [self dataAnswerForRequestMethod:method
                                      withUrlString:urlString
                                     withParameters:parameters
                                           response:response
                                              error:error];
    
    NSDictionary *jsonAnswer;
    if ( !(*error) ) {
        jsonAnswer = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:error];

        //NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        //NSLog(@"Response is:\n%@", jsonString);
    }
    
    return jsonAnswer;
}

@end

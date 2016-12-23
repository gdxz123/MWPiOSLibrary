//
//  APIClient.h
//  MVVM
//
//  Created by develop on 15/9/17.
//  Copyright (c) 2015年 songhailiang. All rights reserved.
//

#import "AFHTTPRequestOperationManager+RACSupport.h"

extern NSString * const MWPNetworkErrorDomain;

@interface MWPNetwork : AFHTTPRequestOperationManager

+ (MWPNetwork *)sharedInstance;

+ (RACSignal *)get:(NSString *)url
        parameters:(NSDictionary *)parameters
         modelName:(NSString *)modelName;
@end

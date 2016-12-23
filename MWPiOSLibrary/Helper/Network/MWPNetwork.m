//
//  APIClient.m
//  MVVM
//
//  Created by develop on 15/9/17.
//  Copyright (c) 2015年 songhailiang. All rights reserved.
//

#import "MWPNetwork.h"
#import "MWPNetworkStatus.h"

NSString * const MWPNetworkErrorDomain = kServerHost;

@implementation MWPNetwork

SHARED_INSTANCE(MWPNetwork)

- (instancetype)init {
    
    self = [super init];
    if (self) {
        AFSecurityPolicy *securityPolicy = [AFSecurityPolicy defaultPolicy];
        securityPolicy.allowInvalidCertificates = YES;
        self.securityPolicy = securityPolicy;
        self.requestSerializer = [AFJSONRequestSerializer serializer];
        
        self.responseSerializer = [AFJSONResponseSerializer serializer];
        NSMutableSet *acceptableContentTypes = [NSMutableSet setWithSet:self.responseSerializer.acceptableContentTypes];
        [acceptableContentTypes addObject:@"application/json"];
        [acceptableContentTypes addObject:@"text/plain"];
        [acceptableContentTypes addObject:@"text/html"];
        self.responseSerializer.acceptableContentTypes = acceptableContentTypes;
    }
    return self;
    
}

+ (RACSignal *)get:(NSString *)url
        parameters:(id)parameters
         modelName:(NSString *)modelName {
    
    return [[[[[MWPNetwork sharedInstance] rac_GET:url parameters:parameters]
             catch:^RACSignal *(NSError *error) {
                 return [RACSignal error:error];
             }]
            map:^id(RACTuple *tuple) {
                if (!tuple) {
                    DDLogError(@"The url : %@ get empty result.", url);
                    return [RACSignal empty];
                }
                return [tuple first];
            }]
            map:^id(id dictionary) {
                if (!modelName) {
                    DDLogWarn(@"You have passed empty model name for url : %@", url);
                    return dictionary;
                }
                NSError *parseModelError;
                Class clazz = NSClassFromString(modelName);
                JSONModel *model = [[clazz alloc]initWithDictionary:dictionary error:&parseModelError];
                if (parseModelError) {
                    DDLogError(@"There occurs error when parsing model, the reason is : %@", parseModelError);
                    return [RACSignal empty];
                }
                return model;
            }];
    
}
@end

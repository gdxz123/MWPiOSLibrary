//
//  MWPNetwork.m
//  MWPiOSLibrary
//
//  Created by dingrui on 2016/12/20.
//  Copyright © 2016年 lmule. All rights reserved.
//

#import "MWPNetwork.h"
#import "JSONModel.h"

@implementation MWPNetwork

/**
 *  初始化AFHTTPRequestOperationManager对象
 *
 *  @return AFHTTPRequestOperationManager
 */
+ (AFHTTPRequestOperationManager *)setupRequestOperationManager {
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    
    //    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    //    [manager.requestSerializer setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    NSMutableSet *acceptableContentTypes = [NSMutableSet setWithSet:manager.responseSerializer.acceptableContentTypes];
    [acceptableContentTypes addObject:@"application/json"];
    [acceptableContentTypes addObject:@"text/plain"];
    [acceptableContentTypes addObject:@"text/html"];
    manager.responseSerializer.acceptableContentTypes = acceptableContentTypes;
    
    
    return manager;
}

/**
 *  系统、设备字典
 *
 *  @return 系统、设备字典
 */
+ (NSMutableDictionary *)setupRequestDeviceParameters {
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]init];
    
    parameters[@"app_version"] = APP_VERSION;
    parameters[@"system_version"] = SYSTEM_VERSION;
    parameters[@"language"] = LANGUAGE;
    parameters[@"platform"] = PLATFORM;
//    parameters[@"device_id"] = [MWPDevice sharedInstance].deviceUUID;
    
    return parameters;
}

@end

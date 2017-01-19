//
//  MWPBaseModel.m
//  MWPiOSLibrary
//
//  Created by dingrui on 2017/1/1.
//  Copyright © 2017年 lmule. All rights reserved.
//

#import "MWPBaseModel.h"

@implementation MWPBaseModel

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:@{
               @"errorCode":@"code",
               @"errorMessage":@"message"
           }];
}

@end

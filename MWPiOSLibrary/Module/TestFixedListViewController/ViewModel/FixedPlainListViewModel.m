//
//  ProductListViewModel.m
//  MVVM
//
//  Created by develop on 15/9/17.
//  Copyright (c) 2015年 songhailiang. All rights reserved.
//

#import "FixedPlainListViewModel.h"

@interface FixedPlainListViewModel ()

@end

@implementation FixedPlainListViewModel

#pragma mark ==== life cycle ====

- (instancetype)init {
    self = [self initWithDataItems:[self getDataItemsConfiguration]];
    return self;
}

#pragma mark ==== private method ====

- (NSDictionary *)getDataItemsConfiguration {
    return @{
             kMWPFixedListConfigDefaultKey:@{
                     
                     },
             kMWPFixedListConfigItemsKey:@[
                     @{
                   kMWPFixedListConfigIdentifier  :@"FixedListCell1"
                     },
                     @{
                         kMWPFixedListConfigIdentifier  :@"FixedListCell1"
                     }
              ]
             };
}


@end

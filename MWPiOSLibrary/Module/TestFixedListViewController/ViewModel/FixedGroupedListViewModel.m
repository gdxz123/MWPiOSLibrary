//
//  ProductListViewModel.m
//  MVVM
//
//  Created by develop on 15/9/17.
//  Copyright (c) 2015年 songhailiang. All rights reserved.
//

#import "FixedGroupedListViewModel.h"

@interface FixedGroupedListViewModel ()

@end

@implementation FixedGroupedListViewModel

#pragma mark ==== life cycle ====

- (instancetype)init {
    self = [self initWithDataItems:[self getDataItemsConfiguration]];
    return self;
}

#pragma mark ==== private method ====

- (NSDictionary *)getDataItemsConfiguration {
    return @{
             kMWPFixedListConfigDefaultKey:@{
                     kMWPFixedListConfigIdentifier  :@"FixedListCell2"
                     },
             kMWPFixedListConfigItemsKey:@[
                     @[
                     @{
                         kMWPFixedListConfigIdentifier  :@"FixedListCell1",
                         kMWPFixedListConfigParam : @{@"a" : @1},
                     },
                     @{
                         
                         },
                     @{
                         
                         },
                     @{
                         
                         },
                     @{
                         
                         }
                     ]
                     ]
             };
}


@end

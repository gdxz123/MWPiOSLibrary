//
//  MWPBaseFixedViewModel.m
//  MWPiOSLibrary
//
//  Created by dingrui on 2017/1/18.
//  Copyright © 2017年 lmule. All rights reserved.
//

#import "MWPBaseFixedGroupedListViewModel.h"

@interface MWPBaseFixedGroupedListViewModel()

@end

@implementation MWPBaseFixedGroupedListViewModel

#pragma mark ==== life cycle ====

- (instancetype)initWithDataItems:(NSDictionary *)dataItems {
    self = [super init];
    if (self) {
        [self setupConfig:dataItems];
    }
    return self;
}

#pragma mark ==== public method ====

#pragma mark ==== private method ====

- (void)setupConfig:(NSDictionary *)dataItems {
    self.dataItems = [NSMutableArray array];
    NSMutableDictionary *defaultConfig = [dataItems[kMWPFixedListConfigDefaultKey] mutableCopy];
    NSArray *itemsConfig = dataItems[kMWPFixedListConfigItemsKey];
    if (!defaultConfig) {
        defaultConfig = [NSMutableDictionary dictionary];
        defaultConfig[kMWPFixedListConfigIdentifier] = kMWPFixedListConfigDefaultIdentifier;
        defaultConfig[kMWPFixedListConfigRowHeight] = @(kMWPFixedListConfigDefaultRowHeight);
    }
    
    //获取默认的identifier
    if (!defaultConfig[kMWPFixedListConfigIdentifier]) {
        defaultConfig[kMWPFixedListConfigIdentifier] = kMWPFixedListConfigDefaultIdentifier;
    }
    //获取默认行高
    if (!defaultConfig[kMWPFixedListConfigRowHeight]) {
        defaultConfig[kMWPFixedListConfigRowHeight] = @(kMWPFixedListConfigDefaultRowHeight);
    }
    
    for (NSUInteger i = 0; i < [itemsConfig count]; i++) {
        NSMutableArray *itemArray = [NSMutableArray array];
        for (NSDictionary *dict in itemsConfig[i]) {
            NSMutableDictionary *defaultConfigCopy = [defaultConfig mutableCopy];
            [defaultConfigCopy addEntriesFromDictionary:dict];
            [itemArray addObject:defaultConfigCopy];
        }
        [self.dataItems addObject:itemArray];
    }
}

@end

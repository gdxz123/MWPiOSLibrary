//
//  MWPBaseFixedViewModel.m
//  MWPiOSLibrary
//
//  Created by dingrui on 2017/1/18.
//  Copyright © 2017年 lmule. All rights reserved.
//

#import "MWPBaseFixedPlainListViewModel.h"

#define kMWPFixedListConfigDefaultIdentifier @"MWPBaseCell"

#define kMWPFixedListConfigDefaultRowHeight 44


@interface MWPBaseFixedPlainListViewModel()



@end

@implementation MWPBaseFixedPlainListViewModel

#pragma mark ==== life cycle ====

- (instancetype)initWithDataItems:(NSDictionary *)dataItems {
    self = [super init];
    if (self) {
        [self setupConfiguration:dataItems];
    }
    return self;
}

#pragma mark ==== public method ====

- (NSDictionary *)getDataItemByIndexPath:(NSIndexPath *)indexPath {
    return self.dataItems[(NSUInteger)indexPath.row];
}

#pragma mark ==== private method ====

- (void)setupConfiguration:(NSDictionary *)dataItems {
    self.dataItems = [NSMutableArray array];
    NSMutableDictionary *defaultConfig = [dataItems[kMWPFixedListConfigDefaultKey] mutableCopy];
    NSArray *itemsConfig = dataItems[kMWPFixedListConfigItemsKey];
    if (!defaultConfig) {
        self.dataItems = [itemsConfig mutableCopy];
        return;
    }
    
    if (!defaultConfig[kMWPFixedListConfigIdentifier]) {
        defaultConfig[kMWPFixedListConfigIdentifier] = kMWPFixedListConfigDefaultIdentifier;
    }
    if (!defaultConfig[kMWPFixedListConfigRowHeight]) {
        defaultConfig[kMWPFixedListConfigRowHeight] = @(kMWPFixedListConfigDefaultRowHeight);
    }
    
    for (NSUInteger i = 0; i < [itemsConfig count]; i++) {
        NSMutableDictionary *defaultConfigCopy = [defaultConfig mutableCopy];
        [defaultConfigCopy addEntriesFromDictionary:itemsConfig[i]];
        [self.dataItems addObject:defaultConfigCopy];
    }
}

@end

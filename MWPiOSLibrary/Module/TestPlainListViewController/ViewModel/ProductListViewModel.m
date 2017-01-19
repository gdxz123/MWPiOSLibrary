//
//  ProductListViewModel.m
//  MVVM
//
//  Created by develop on 15/9/17.
//  Copyright (c) 2015年 songhailiang. All rights reserved.
//

#import "ProductListViewModel.h"

@interface ProductListViewModel ()

@end

@implementation ProductListViewModel

#pragma mark ==== life cycle ====

- (instancetype)init {
    if (self = [super init]) {
        [self setupViewModel];
    }
    return self;
}

- (void)setupViewModel {
    self.pagingUrlKey = @"page";
    [self setupQueryDictionary:@{
            @"category_id":@"2",
            @"per-page":@"12"
                                 }];
    [self mergeErrorSignals:@[self.fetchDataItemsCommand.errors]];
}

#pragma mark ==== property getter && setter ====

-(RACSignal *)fetchDataItemsSignal {
    return [MWPNetwork get:kProductList parameters:self.queryDictionary modelName:@"TestModel"];
}

@end

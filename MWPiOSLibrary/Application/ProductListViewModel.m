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

#pragma mark - init

- (instancetype)init {
    if (self = [super init]) {
        
        [self initCommand];
        
        [self initSubscribe];
    }
    return self;
}

- (void)initCommand {
    
    _fetchProductCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
        
        return [MWPNetwork get:@"http://www.sina.com/api/hotword.json" parameters:[NSDictionary new] modelName:nil];
        
    }];
    
}


- (void)initSubscribe {
    
    [[_fetchProductCommand.executionSignals switchToLatest] subscribeNext:^(id data) {
        NSLog(@"返回结果了%@", data);
    }];
    
    [[RACSignal merge:@[_fetchProductCommand.errors]] subscribe:self.errorSignal];
}

#pragma mark - method


@end

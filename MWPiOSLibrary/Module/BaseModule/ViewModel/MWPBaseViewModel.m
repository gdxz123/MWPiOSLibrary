//
//  BaseViewModel.m
//  MWPiOSLibrary
//
//  Created by dingrui on 2017/1/1.
//  Copyright © 2017年 lmule. All rights reserved.
//

#import "MWPBaseViewModel.h"

@implementation MWPBaseViewModel

#pragma mark ==== life cycle ====

- (instancetype)init {
    self = [super init];
    if (self) {
        [self.errorSignal subscribeNext:^(NSError *error) {
            [MWPToast showTitle:error.domain];
        }];
    }
    return self;
}

- (void)dealloc {
    [self.errorSignal sendCompleted];
}

#pragma mark ==== public method ====

- (void)mergeErrorSignals:(NSArray<RACSignal *> *)viewModelErrorSignals {
    [[RACSignal merge:viewModelErrorSignals] subscribe:self.errorSignal];
}

#pragma mark ==== property getter && setter ====

- (RACSubject *)errorSignal {
    if (_errorSignal) {
        return _errorSignal;
    }
    
    _errorSignal = [RACSubject subject];
    return _errorSignal;
}

- (RACSubject *)willDisappearSignal {
    if (_willDisappearSignal) {
        return _willDisappearSignal;
    }
    
    _willDisappearSignal = [RACSubject subject];
    return _willDisappearSignal;
}

@end

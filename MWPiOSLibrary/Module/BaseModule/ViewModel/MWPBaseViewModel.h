//
//  BaseViewModel.h
//  MWPiOSLibrary
//
//  Created by dingrui on 2017/1/1.
//  Copyright © 2017年 lmule. All rights reserved.
//

@interface MWPBaseViewModel : NSObject

@property (nonatomic) RACSubject *errorSignal;

@property (nonatomic) RACSubject *willDisappearSignal;

- (void)mergeErrorSignals:(NSArray<RACSignal *> *)viewModelErrorSignals;

@end

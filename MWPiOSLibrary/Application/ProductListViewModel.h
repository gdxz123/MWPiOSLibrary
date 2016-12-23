//
//  ProductListViewModel.h
//  MVVM
//
//  Created by develop on 15/9/17.
//  Copyright (c) 2015年 songhailiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseViewModel.h"
#import "MWPNetwork.h"

@interface ProductListViewModel : BaseViewModel

/**
 *  数据
 */
/**
 *  是否有更多数据
 */
@property (nonatomic, strong) RACSignal *hasMoreData;

/**
 *  获取数据Command
 */
@property (nonatomic, strong, readonly) RACCommand *fetchProductCommand;

/**
 *  获取更多数据
 */
@property (nonatomic, strong, readonly) RACCommand *fetchMoreProductCommand;


@end

//
//  BaseListViewModel.h
//  MWPiOSLibrary
//
//  Created by dingrui on 2017/1/1.
//  Copyright © 2017年 lmule. All rights reserved.
//

#import "MWPBaseViewModel.h"

@interface MWPBasePlainListViewModel : MWPBaseViewModel

@property (nonatomic, strong) NSMutableDictionary *queryDictionary;

@property (nonatomic, copy) NSString *pagingUrlKey;

@property (nonatomic, assign) int recordCountPerPage;

@property (nonatomic, strong) NSArray *dataItems;

@property (nonatomic, strong) RACCommand *fetchDataItemsCommand;

@property (nonatomic, strong) RACSignal *fetchDataItemsSignal;

- (void)loadFirstPage;

- (void)loadNextPage;

- (void)setupQueryDictionary:(NSDictionary *)queryDictionary;


@end

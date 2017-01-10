//
//  BaseListViewModel.m
//  MWPiOSLibrary
//
//  Created by dingrui on 2017/1/1.
//  Copyright © 2017年 lmule. All rights reserved.
//


typedef NS_ENUM(NSUInteger, MWPListViewControllerCurrentPageAction) {
    MWPListViewControllerCurrentPageNext,
    MWPListViewControllerCurrentPageFirst,
    MWPListViewControllerCurrentPageError
};

#import "MWPBaseListViewModel.h"

@interface MWPBaseListViewModel()

@property (nonatomic, assign) NSNumber *currentPage;

@end

@implementation MWPBaseListViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupBaseViewModel];
    }
    return self;
}

- (void)setupBaseViewModel {
    
    self.pagingUrlKey = @"page";
    self.recordCountPerPage = 10;
    self.currentPage = @(1);
    self.queryDictionary = [NSMutableDictionary new];
    
    [RACObserve(self, currentPage) subscribeNext:^(NSNumber *currentPage) {
        self.queryDictionary[self.pagingUrlKey] = currentPage;
    }];
}

#pragma mark ==== property getter && setter ====

- (RACCommand *)fetchDataItemsCommand {
    if (_fetchDataItemsCommand) {
        return _fetchDataItemsCommand;
    }
    
    _fetchDataItemsCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        return [self.fetchDataItemsSignal takeUntil:self.willDisappearSignal];
    }];
    
    [[_fetchDataItemsCommand.executionSignals switchToLatest] subscribeNext:^(MWPBaseModel *baseModel) {
        NSMutableArray *tmp = [NSMutableArray arrayWithArray:self.dataItems];
        NSArray *responseData = (NSArray *)baseModel.data;
        [tmp addObjectsFromArray:responseData];
        self.dataItems = tmp;
    }];
    [_fetchDataItemsCommand.errors subscribeNext:^(id x) {
        [self setCurrentPageByAction:MWPListViewControllerCurrentPageError];
    }];
    
    return _fetchDataItemsCommand;
}

#pragma mark ==== other method ====

- (void)setupQueryDictionary:(NSDictionary *)queryDictionary {
    for (NSString *key in queryDictionary) {
        self.queryDictionary[key] = queryDictionary[key];
    }
}

- (void)loadFirstPage {
    [self resetDataItems];
    [self.fetchDataItemsCommand execute:nil];
}

- (void)loadNextPage {
    [self setCurrentPageByAction:MWPListViewControllerCurrentPageNext];
    [self.fetchDataItemsCommand execute:nil];
}

- (void)resetDataItems {
    [self setCurrentPageByAction:MWPListViewControllerCurrentPageFirst];
    self.dataItems = [NSArray array];
}

- (void)setCurrentPageByAction:(MWPListViewControllerCurrentPageAction)action{
    NSInteger page = [self.currentPage integerValue];
    switch (action) {
        case MWPListViewControllerCurrentPageNext:
            page += 1;
            break;
        case MWPListViewControllerCurrentPageError:
            page = (page > 1) ? (page - 1) : 1;
            break;
        case MWPListViewControllerCurrentPageFirst:
            page = 1;
            break;
        default:
            break;
    }
    
    self.currentPage = @(page);
}

@end

//
//  ViewController.m
//  MVVM
//
//  Created by develop on 15/9/17.
//  Copyright (c) 2015年 songhailiang. All rights reserved.
//

#import "ProductListViewController.h"
#import "MWPNetwork.h"
#import "ProductListViewModel.h"
#import <MJRefresh/MJRefresh.h>

@interface ProductListViewController ()


@property (nonatomic, strong) ProductListViewModel *viewModel;

@end

@implementation ProductListViewController

#pragma mark - Life Circle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initViewModel];
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UI


- (void)initViewModel {
    
    _viewModel = [[ProductListViewModel alloc] init];
    [[_viewModel.fetchProductCommand.executing skip:1] subscribeNext:^(NSNumber *executing) {
        NSLog(@"command executing:%@", executing);
    }];
    
    [_viewModel.errorSignal subscribeNext:^(NSError *error) {
        NSLog(@"something error:%@", error);
    }];
    
    
}

#pragma mark - View Method

- (void)loadData {
    
    [self.viewModel.fetchProductCommand execute:nil];
}

- (void)loadMoreData {
    [self.viewModel.fetchMoreProductCommand execute:nil];
}


@end

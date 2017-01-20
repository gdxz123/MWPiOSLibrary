//
//  ViewController.m
//  MVVM
//
//  Created by develop on 15/9/17.
//  Copyright (c) 2015年 songhailiang. All rights reserved.
//

#import "FixedGroupedListViewController.h"
#import "FixedGroupedListViewModel.h"
#import "FixedListCell1.h"


@interface FixedGroupedListViewController ()




@end

@implementation FixedGroupedListViewController

#pragma mark ==== life cycle ====

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViewModel];
    [self registerCellClass];
}


#pragma mark ==== private method ====

- (void)setupViewModel {
    self.viewModel = [[FixedGroupedListViewModel alloc]init];
}

@end

//
//  ViewController.m
//  MVVM
//
//  Created by develop on 15/9/17.
//  Copyright (c) 2015年 songhailiang. All rights reserved.
//

#import "FixedPlainListViewController.h"
#import "FixedPlainListViewModel.h"
#import "FixedListCell1.h"


@interface FixedPlainListViewController ()




@end

@implementation FixedPlainListViewController

#pragma mark ==== life cycle ====

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViewModel];
    [self registerCellClass];
}

#pragma mark ==== uitableview datasource ====

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self getCellDataItem:indexPath];
}

#pragma mark ==== private method ====

- (void)setupViewModel {
    self.viewModel = [[FixedPlainListViewModel alloc]init];
}

@end

//
//  ViewController.m
//  MVVM
//
//  Created by develop on 15/9/17.
//  Copyright (c) 2015年 songhailiang. All rights reserved.
//

#import "ProductListViewController.h"
#import "ProductListViewModel.h"
#import "ProductCell.h"

@interface ProductListViewController ()

@property (nonatomic, strong) ProductListViewModel *viewModel;

@end

@implementation ProductListViewController

#pragma mark ==== life cycle ====

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (_start == YES) {
        [self.navigationController pushViewController:[ProductListViewController new] animated:YES];
    }
    
    [self.tableView registerClass:[ProductCell class] forCellReuseIdentifier:@"cell"];
    
    [RACObserve(self.viewModel, dataItems) subscribeNext:^(id x) {
        [self.tableView reloadData];
    }];
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.viewModel loadFirstPage];
    }];
    self.tableView.mj_footer = [MJRefreshAutoFooter footerWithRefreshingBlock:^{
        [self.viewModel loadNextPage];
    }];
    [self.tableView.mj_header beginRefreshing];
}

#pragma mark ==== property getter && setter ====

- (ProductListViewModel *)viewModel {
    if (_viewModel) {
        return _viewModel;
    }
    _viewModel = [[ProductListViewModel alloc] init];
    [[_viewModel.fetchDataItemsCommand.executing skip:1] subscribeNext:^(NSNumber *executing) {
        if ([executing boolValue]) {
            DDLogInfo(@"正在加载中");
            [MWPToast showHUD];
            return;
        }
        DDLogInfo(@"加载完成");
        [MWPToast hideAllHUDs];
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
    }];
    [self.rac_willDeallocSignal subscribe:_viewModel.willDisappearSignal];
    
    return _viewModel;
}

#pragma mark ==== uitableview datasource ====

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return (NSInteger)self.viewModel.dataItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.model = (ProductModel *)self.viewModel.dataItems[(NSUInteger)indexPath.row];
    return cell;
}

@end

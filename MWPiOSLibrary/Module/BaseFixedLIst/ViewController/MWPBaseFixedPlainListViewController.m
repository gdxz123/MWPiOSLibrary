//
//  MWPFixedViewController.m
//  MWPiOSLibrary
//
//  Created by dingrui on 2017/1/18.
//  Copyright © 2017年 lmule. All rights reserved.
//

#import "MWPBaseFixedPlainListViewController.h"

@interface MWPBaseFixedPlainListViewController ()

@end

@implementation MWPBaseFixedPlainListViewController

#pragma mark ==== life cycle ====

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}

- (void)viewDidLayoutSubviews {
    self.tableView.sd_layout
    .topEqualToView(self.view)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .bottomEqualToView(self.view);
}

#pragma mark ==== public method ====

- (void)registerCellClass {
    NSMutableDictionary *classDictionary = [NSMutableDictionary dictionary];
    for (NSDictionary *dict in self.viewModel.dataItems) {
        NSString *identifier = dict[kMWPFixedListConfigIdentifier];
        Class identifierClass = NSClassFromString(identifier);
        if (!identifierClass || [classDictionary[identifier] isEqualToString:@"1"]) {
            continue;
        }
        [self.tableView registerClass:identifierClass forCellReuseIdentifier:identifier];
        classDictionary[identifier] = @"1";
    }
}

- (MWPBaseCell *)getCellDataItem:(NSIndexPath *)indexPath {
    NSDictionary *dataItemConfig = [self.viewModel getDataItemByIndexPath:indexPath];
    MWPBaseCell *cell = [self.tableView dequeueReusableCellWithIdentifier:dataItemConfig[kMWPFixedListConfigIdentifier] forIndexPath:indexPath];
    cell.dataItemConfig = dataItemConfig;
    return cell;
}

#pragma mark ==== uitableview datasource ====

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return (NSInteger)self.viewModel.dataItems.count;
}


#pragma mark ==== property getter && setter ====

- (UITableView *)tableView {
    if (_tableView) {
        return _tableView;
    }
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    return _tableView;
}

#pragma mark ==== private method ====

- (void)setupView {
    [self.view addSubview:self.tableView];
    [RACObserve(self.viewModel, dataItems) subscribeNext:^(id x) {
        [self.tableView reloadData];
    }];
}

@end

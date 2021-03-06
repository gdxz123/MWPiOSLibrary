//
//  MWPBaseListViewController.m
//  MWPiOSLibrary
//
//  Created by dingrui on 2017/1/2.
//  Copyright © 2017年 lmule. All rights reserved.
//

#import "MWPBasePlainListViewController.h"

@interface MWPBasePlainListViewController ()

@end

@implementation MWPBasePlainListViewController

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

#pragma mark ==== property getter && setter ====

- (UITableView *)tableView {
    if (_tableView) {
        return _tableView;
    }
    
    _tableView = [[UITableView alloc]init];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    return _tableView;
}

#pragma mark ==== private method ====


- (void)setupView {
    [self.view addSubview:self.tableView];
}


@end

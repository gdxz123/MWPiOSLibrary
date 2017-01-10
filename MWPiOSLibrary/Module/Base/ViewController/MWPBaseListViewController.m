//
//  MWPBaseListViewController.m
//  MWPiOSLibrary
//
//  Created by dingrui on 2017/1/2.
//  Copyright © 2017年 lmule. All rights reserved.
//

#import "MWPBaseListViewController.h"

@interface MWPBaseListViewController ()

@end

@implementation MWPBaseListViewController

#pragma mark ==== life cycle ====

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}

- (void)setupView {
    [self.view addSubview:self.tableView];
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

@end

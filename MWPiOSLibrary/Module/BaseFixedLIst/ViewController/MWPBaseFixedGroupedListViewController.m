//
//  MWPFixedViewController.m
//  MWPiOSLibrary
//
//  Created by dingrui on 2017/1/18.
//  Copyright © 2017年 lmule. All rights reserved.
//

#import "MWPBaseFixedGroupedListViewController.h"

@interface MWPBaseFixedGroupedListViewController ()

@end

@implementation MWPBaseFixedGroupedListViewController

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
    for (NSUInteger i = 0; i < [self.viewModel.dataItems count]; i++) {
        for (NSDictionary *dict in self.viewModel.dataItems[i]) {
            NSString *identifier = dict[kMWPFixedListConfigIdentifier];
            Class identifierClass = NSClassFromString(identifier);
            if (!identifierClass || [classDictionary[identifier] isEqualToString:@"1"]) {
                continue;
            }
            [self.tableView registerClass:identifierClass forCellReuseIdentifier:identifier];
            classDictionary[identifier] = @"1";
        }
    }
}

#pragma mark ==== uitableview datasource ====

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return (NSInteger)self.viewModel.dataItems.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return (NSInteger)[self.viewModel.dataItems[(NSUInteger)section] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    MWPBaseCell *cell = [self.viewModel getCellByIndexPath:indexPath];
    return cell.rowHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.viewModel getCellByIndexPath:indexPath];
}

#pragma mark ==== uitableview delegate ====

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MWPBaseCell *cell = [self.viewModel getCellByIndexPath:indexPath];
    if ([cell.target isKindOfClass:[NSString class]]) {
        Class targetClass = NSClassFromString(cell.target);
        UIViewController *targetViewController = [[targetClass alloc]init];
        [self.navigationController pushViewController:targetViewController animated:YES];
    }
    else if ([cell respondsToSelector:NSSelectorFromString(kMWPFixedListConfigTarget)]) {
        SuppressPerformSelectorLeakWarning([cell performSelector:NSSelectorFromString(kMWPFixedListConfigTarget)]);
    }
}

#pragma mark ==== property getter && setter ====

- (UITableView *)tableView {
    if (_tableView) {
        return _tableView;
    }
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    //去掉多余的cell分割线
    [_tableView setTableFooterView:[[UIView alloc]initWithFrame:CGRectZero]];
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

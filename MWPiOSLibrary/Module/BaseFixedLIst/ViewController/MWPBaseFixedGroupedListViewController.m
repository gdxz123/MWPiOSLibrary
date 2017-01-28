//
//  MWPFixedViewController.m
//  MWPiOSLibrary
//
//  Created by dingrui on 2017/1/18.
//  Copyright © 2017年 lmule. All rights reserved.
//

#import "MWPBaseFixedGroupedListViewController.h"
#import "ReactiveCocoa.h"

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
    
    [RACObserve(self.viewModel, dataItems) subscribeNext:^(id x) {
        [self.tableView reloadData];
    }];
}

#pragma mark ==== uitableview datasource ====

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return (NSInteger)self.viewModel.dataItems.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return (NSInteger)[self.viewModel.dataItems[(NSUInteger)section] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self getCellHeightByIndexPath:indexPath];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self getCellByIndexPath:indexPath];
}

#pragma mark ==== uitableview delegate ====

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    MWPBaseCell *cell = [self getCellByIndexPath:indexPath];

    if ([cell.targetViewController isKindOfClass:[NSString class]]) {
        Class targetClass = NSClassFromString(cell.targetViewController);
        UIViewController *targetViewController = [[targetClass alloc]init];
        [self.navigationController pushViewController:targetViewController animated:YES];
    }
    else if (cell.targetBlock) {
        cell.targetBlock();
    }
}

#pragma mark ==== property getter && setter ====

- (UITableView *)tableView {
    if (_tableView) {
        return _tableView;
    }
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    //去掉多余的cell分割线
    [_tableView setTableFooterView:[[UIView alloc]initWithFrame:CGRectZero]];
    return _tableView;
}

#pragma mark ==== private method ====

- (void)setupView {
    [self.view addSubview:self.tableView];
}

- (CGFloat)getCellHeightByIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dataItemDictionary = self.viewModel.dataItems[(NSUInteger)indexPath.section][(NSUInteger)indexPath.row];
    if (dataItemDictionary[kMWPFixedListConfigRowHeight]) {
        return [dataItemDictionary[kMWPFixedListConfigRowHeight] floatValue];
    }
    MWPBaseCell *cell = [NSClassFromString(dataItemDictionary[kMWPFixedListConfigIdentifier]) new];
    SEL rowHeightSelector = NSSelectorFromString(kMWPFixedListConfigRowHeight);
    if ([cell respondsToSelector:rowHeightSelector]) {
        SuppressPerformSelectorLeakWarning(return [[cell performSelector:rowHeightSelector] floatValue];);
    }
    return kMWPFixedListConfigDefaultRowHeight;
}

- (MWPBaseCell *)getCellByIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dataItemDictionary = self.viewModel.dataItems[(NSUInteger)indexPath.section][(NSUInteger)indexPath.row];
    MWPBaseCell *cell = [self.tableView dequeueReusableCellWithIdentifier:dataItemDictionary[kMWPFixedListConfigIdentifier] forIndexPath:indexPath];
    cell.dataItemConfig = dataItemDictionary;
    
    SEL rowHeightSelector = NSSelectorFromString(kMWPFixedListConfigRowHeight);
    CGFloat rowHeight = 0;
    if (dataItemDictionary[kMWPFixedListConfigRowHeight]) {
        rowHeight = [dataItemDictionary[kMWPFixedListConfigRowHeight] floatValue];
    }
    else if ([cell respondsToSelector:rowHeightSelector]) {
        SuppressPerformSelectorLeakWarning(rowHeight = [[cell performSelector:rowHeightSelector] floatValue];);
    }
    cell.rowHeight = rowHeight;
    
    if (dataItemDictionary[kMWPFixedListConfigTargetViewController]) {
        cell.targetViewController = dataItemDictionary[kMWPFixedListConfigTargetViewController];
    }
    if (dataItemDictionary[kMWPFixedListConfigTargetBlock]) {
        cell.targetBlock = dataItemDictionary[kMWPFixedListConfigTargetBlock];
    }
    return cell;
}

@end

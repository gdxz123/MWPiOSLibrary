//
//  MWPFixedViewController.h
//  MWPiOSLibrary
//
//  Created by dingrui on 2017/1/18.
//  Copyright © 2017年 lmule. All rights reserved.
//

#import "MWPBaseViewController.h"
#import "MWPBaseFixedPlainListViewModel.h"
#import "MWPBaseCell.h"

@interface MWPBaseFixedPlainListViewController : MWPBaseViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) MWPBaseFixedPlainListViewModel *viewModel;

- (void)registerCellClass;

- (MWPBaseCell *)getCellDataItem:(NSIndexPath *)indexPath;

@end

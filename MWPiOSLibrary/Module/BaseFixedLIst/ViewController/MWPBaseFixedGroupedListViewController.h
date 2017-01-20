//
//  MWPFixedViewController.h
//  MWPiOSLibrary
//
//  Created by dingrui on 2017/1/18.
//  Copyright © 2017年 lmule. All rights reserved.
//

#import "MWPBaseViewController.h"
#import "MWPBaseFixedGroupedListViewModel.h"
#import "MWPBaseCell.h"

@interface MWPBaseFixedGroupedListViewController : MWPBaseViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) MWPBaseFixedGroupedListViewModel *viewModel;

/**
 循环注册配置中的identifier
 */
- (void)registerCellClass;

@end

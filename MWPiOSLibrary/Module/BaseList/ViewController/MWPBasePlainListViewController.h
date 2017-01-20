//
//  MWPBaseListViewController.h
//  MWPiOSLibrary
//
//  Created by dingrui on 2017/1/2.
//  Copyright © 2017年 lmule. All rights reserved.
//

#import "MWPBaseViewController.h"
#import "MJRefresh.h"

@interface MWPBasePlainListViewController : MWPBaseViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

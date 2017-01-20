//
//  MWPBaseFixedViewModel.h
//  MWPiOSLibrary
//
//  Created by dingrui on 2017/1/18.
//  Copyright © 2017年 lmule. All rights reserved.
//

#import "MWPBaseViewModel.h"
#import "MWPBaseFixedListMacro.h"

@interface MWPBaseFixedPlainListViewModel : MWPBaseViewModel

@property (nonatomic, strong) NSMutableArray *dataItems;

- (instancetype)initWithDataItems:(NSDictionary *)dataItems;

- (NSDictionary *)getDataItemByIndexPath:(NSIndexPath *)indexPath;
@end

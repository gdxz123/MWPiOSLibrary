//
//  MWPBaseFixedViewModel.h
//  MWPiOSLibrary
//
//  Created by dingrui on 2017/1/18.
//  Copyright © 2017年 lmule. All rights reserved.
//

#import "MWPBaseViewModel.h"
#import "MWPBaseFixedListMacro.h"
#import "MWPBaseCell.h"

@interface MWPBaseFixedGroupedListViewModel : MWPBaseViewModel

@property (nonatomic, strong) NSMutableArray *dataItems;

- (instancetype)initWithDataItems:(NSDictionary *)dataItems;

/**
 在tableview中使用的时候，通过indexPath获取MWPBaseCell

 @param indexPath indexPath
 @return MWPBaseCell
 */
- (MWPBaseCell *)getCellByIndexPath:(NSIndexPath *)indexPath;

@end

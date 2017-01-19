//
//  MWPBaseFixedViewModel.h
//  MWPiOSLibrary
//
//  Created by dingrui on 2017/1/18.
//  Copyright © 2017年 lmule. All rights reserved.
//

#import "MWPBaseViewModel.h"

#define kMWPFixedListConfigDefaultKey @"default"

#define kMWPFixedListConfigItemsKey @"items"

#define kMWPFixedListConfigIdentifier @"identifier"

#define kMWPFixedListConfigRowHeight @"height"

#define kMWPFixedListConfigTargetController @"target"

#define kMWPFixedListConfigParam @"param"

@interface MWPBaseFixedPlainListViewModel : MWPBaseViewModel

@property (nonatomic, strong) NSMutableArray *dataItems;

- (instancetype)initWithDataItems:(NSDictionary *)dataItems;

- (NSDictionary *)getDataItemByIndexPath:(NSIndexPath *)indexPath;
@end

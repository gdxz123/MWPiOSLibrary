//
//  MWPBaseCell.m
//  MWPiOSLibrary
//
//  Created by dingrui on 2017/1/19.
//  Copyright © 2017年 lmule. All rights reserved.
//

#import "MWPBaseCell.h"

@implementation MWPBaseCell

#pragma mark ==== life cycle ====

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupView];
    }
    
    return self;
}

#pragma mark ==== public method ====

+ (MWPBaseCell *)setupWithDataItem:(NSDictionary *)dataItem {
    Class identifierClass = NSClassFromString(dataItem[kMWPFixedListConfigIdentifier]);
    MWPBaseCell *cell = [identifierClass new];
    
    cell.dataItemConfig = dataItem;
    
    SEL rowHeightSelector = NSSelectorFromString(kMWPFixedListConfigRowHeight);
    CGFloat rowHeight = 0;
    if (dataItem[kMWPFixedListConfigRowHeight]) {
        rowHeight = [dataItem[kMWPFixedListConfigRowHeight] floatValue];
    }
    else if ([cell respondsToSelector:rowHeightSelector]) {
        SuppressPerformSelectorLeakWarning(rowHeight = [[cell performSelector:rowHeightSelector] floatValue];);
    }
    cell.rowHeight = rowHeight;
    
    SEL targetSelector = NSSelectorFromString(kMWPFixedListConfigTarget);
    id target;
    if (![cell respondsToSelector:targetSelector]) {
        target = dataItem[kMWPFixedListConfigTarget];
    }
    cell.target = target;
    
    return cell;
}

@end

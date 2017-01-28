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

- (NSDictionary *)paramConfig {
    return self.dataItemConfig[kMWPFixedListConfigParam];
}

#pragma mark ==== property getter && setter ====



@end

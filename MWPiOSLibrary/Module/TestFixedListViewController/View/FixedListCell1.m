//
//  FixedListCell1.m
//  MWPiOSLibrary
//
//  Created by dingrui on 2017/1/19.
//  Copyright © 2017年 lmule. All rights reserved.
//

#import "FixedListCell1.h"
#import "MWPBaseFixedListMacro.h"

@interface FixedListCell1()



@property (strong, nonatomic) UILabel *productLabel;

@end

@implementation FixedListCell1

- (void)setupView {
    [self.contentView addSubview:self.productLabel];
    @weakify(self);
    [RACObserve(self, dataItemConfig) subscribeNext:^(NSDictionary *param) {
        @strongify(self);
        self.productLabel.text = param[kMWPFixedListConfigIdentifier];
    }];
}

- (id)target {
//    return @"FixedGroupedListViewController";
    NSLog(@"%@", self.dataItemConfig);
    return nil;
}

- (UILabel *)productLabel {
    if (_productLabel) {
        return _productLabel;
    }
    _productLabel = [[UILabel alloc] init];
    _productLabel.frame = CGRectMake(0, 0, 100, 44);
    return _productLabel;
}

@end

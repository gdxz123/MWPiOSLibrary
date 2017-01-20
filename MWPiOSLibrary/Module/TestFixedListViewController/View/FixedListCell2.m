//
//  FixedListCell2.m
//  MWPiOSLibrary
//
//  Created by dingrui on 2017/1/19.
//  Copyright © 2017年 lmule. All rights reserved.
//

#import "FixedListCell2.h"
#import "MWPBaseFixedListMacro.h"

@interface FixedListCell2()



@property (strong, nonatomic) UILabel *productLabel;

@end

@implementation FixedListCell2

- (CGFloat)rowHeight {
    return 30;
}

- (id)target {
    NSLog(@"%@", self.dataItemConfig);
    return nil;
}

- (void)setupView {
    [self.contentView addSubview:self.productLabel];
    self.contentView.backgroundColor = [UIColor grayColor];
    @weakify(self);
    [RACObserve(self, dataItemConfig) subscribeNext:^(NSDictionary *param) {
        @strongify(self);
        self.productLabel.text = param[kMWPFixedListConfigIdentifier];
    }];
}

- (UILabel *)productLabel {
    if (_productLabel) {
        return _productLabel;
    }
    _productLabel = [[UILabel alloc] init];
    _productLabel.frame = CGRectMake(0, 0, 100, 44);
    _productLabel.textColor = [UIColor redColor];
    return _productLabel;
}

@end

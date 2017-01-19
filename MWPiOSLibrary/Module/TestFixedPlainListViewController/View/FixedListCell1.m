//
//  FixedListCell1.m
//  MWPiOSLibrary
//
//  Created by dingrui on 2017/1/19.
//  Copyright © 2017年 lmule. All rights reserved.
//

#import "FixedListCell1.h"
#import "MWPBaseFixedPlainListViewModel.h"

@interface FixedListCell1()



@property (strong, nonatomic) UILabel *productLabel;

@end

@implementation FixedListCell1

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.productLabel];
        @weakify(self);
        [RACObserve(self, dataItemConfig) subscribeNext:^(NSDictionary *param) {
            @strongify(self);
            self.productLabel.text = param[kMWPFixedListConfigIdentifier];
        }];
    }
    
    return self;
}

- (UILabel *)productLabel {
    if (_productLabel) {
        return _productLabel;
    }
    _productLabel = [[UILabel alloc] init];
    _productLabel.frame = CGRectMake(0, 0, 100, 100);
    return _productLabel;
}

@end

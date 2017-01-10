//
//  ProductCell.m
//  MWPiOSLibrary
//
//  Created by dingrui on 2017/1/3.
//  Copyright © 2017年 lmule. All rights reserved.
//

#import "ProductCell.h"

@interface ProductCell ()

@property (strong, nonatomic) UILabel *productLabel;

@end

@implementation ProductCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.productLabel];
        @weakify(self);
        [RACObserve(self, model) subscribeNext:^(id x) {
            @strongify(self);
            self.productLabel.text = self.model.main_title;
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

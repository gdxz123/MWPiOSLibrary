//
//  MWPBaseCellLeftLabel.m
//  RehabDoctor
//
//  Created by dingrui on 2017/1/26.
//  Copyright © 2017年 Baidu. All rights reserved.
//

#import "MWPBaseCellLeftLabel.h"
#import "Aspects.h"

@implementation MWPBaseCellLeftLabel

- (instancetype)initWithBaseCell:(MWPBaseCell *)baseCell {
    self = [super init];
    if (self) {
        self.font = kFont(13);
        self.textColor = UIColorFromRGB(0x3a3a3a);
        [self sizeToFit];
    
//        [baseCell aspect_hookSelector:@selector(setupView) withOptions:AspectPositionAfter usingBlock:^{
//            [baseCell.contentView addSubview:self];
//        }error:nil];
        
        [baseCell aspect_hookSelector:@selector(layoutSubviews) withOptions:AspectPositionAfter usingBlock:^{
            [self mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(AutoSize(15));
                make.centerY.mas_equalTo(baseCell.contentView);
                make.height.mas_equalTo(AutoSize(13));
            }];
        }error:nil];
    }
    return self;
}
@end

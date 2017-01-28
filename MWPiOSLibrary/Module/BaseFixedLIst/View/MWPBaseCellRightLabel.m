//
//  MWPBaseCellRightLabel.m
//  RehabDoctor
//
//  Created by dingrui on 2017/1/27.
//  Copyright © 2017年 Baidu. All rights reserved.
//

#import "MWPBaseCellRightLabel.h"
#import "Aspects.h"

@implementation MWPBaseCellRightLabel

- (instancetype)initWithBaseCell:(MWPBaseCell *)baseCell {
    self = [super init];
    if (self) {
        self.font = kFont(12);
        self.textColor = UIColorFromRGB(0xa0a0a0);
        [self sizeToFit];
        
        [baseCell aspect_hookSelector:@selector(layoutSubviews) withOptions:AspectPositionAfter usingBlock:^{
            [self mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(baseCell.contentView).offset(-AutoSize(32));
                make.centerY.mas_equalTo(baseCell.contentView);
                make.height.mas_equalTo(AutoSize(12));
            }];
        }error:nil];
    }
    return self;
}

@end

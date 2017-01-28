//
//  MWPBaseCellBottomLine.m
//  RehabDoctor
//
//  Created by dingrui on 2017/1/27.
//  Copyright © 2017年 Baidu. All rights reserved.
//

#import "MWPBaseCellBottomLine.h"
#import "Aspects.h"

@implementation MWPBaseCellBottomLine

- (instancetype)initWithBaseCell:(MWPBaseCell *)baseCell {
    self = [super init];
    if (self) {
        self.backgroundColor = UIColorFromRGB(0xe5e5e5);
        
        [baseCell aspect_hookSelector:@selector(layoutSubviews) withOptions:AspectPositionAfter usingBlock:^{
                [self mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.mas_equalTo(AutoSize(15));
                    make.bottom.mas_equalTo(baseCell.contentView).offset(1);
                    make.width.mas_equalTo(SCREEN_WIDTH);
                    make.height.mas_equalTo(1);
                }];
        }error:nil];
    }
    return self;
}

@end

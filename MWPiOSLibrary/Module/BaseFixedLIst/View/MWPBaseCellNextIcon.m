//
//  MWPBaseCellNextIcon.m
//  RehabDoctor
//
//  Created by dingrui on 2017/1/27.
//  Copyright © 2017年 Baidu. All rights reserved.
//

#import "MWPBaseCellNextIcon.h"
#import "Aspects.h"

@implementation MWPBaseCellNextIcon

- (instancetype)initWithBaseCell:(MWPBaseCell *)baseCell {
    self = [super init];
    if (self) {
        self.image = [UIImage imageNamed:@"nextIcon"];
        
        [baseCell aspect_hookSelector:@selector(layoutSubviews) withOptions:AspectPositionAfter usingBlock:^{
                [self mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.centerY.mas_equalTo(baseCell.contentView);
                    make.right.mas_equalTo(baseCell.contentView).mas_offset(-AutoSize(15));
                    make.width.mas_equalTo(AutoSize(8));
                    make.height.mas_equalTo(AutoSize(12));
                }];
        }error:nil];
    }
    return self;
}

@end

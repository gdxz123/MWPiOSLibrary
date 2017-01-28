//
//  MWPLeftRightCell.m
//  RehabDoctor
//
//  Created by dingrui on 2017/1/28.
//  Copyright © 2017年 Baidu. All rights reserved.
//

#import "MWPLeftRightCell.h"
#import "MWPBaseFixedListMacro.h"
#import "ReactiveCocoa.h"
#import "MWPBaseCellLeftLabel.h"
#import "MWPBaseCellRightLabel.h"

@implementation MWPLeftRightCell

- (void)setupView {
    self.leftLabel = [[MWPBaseCellLeftLabel alloc]initWithBaseCell:self];
    [self.contentView addSubview:self.leftLabel];
    self.rightLabel = [[MWPBaseCellRightLabel alloc]initWithBaseCell:self];
    [self.contentView addSubview:self.rightLabel];
    
    @weakify(self);
    [RACObserve(self, dataItemConfig) subscribeNext:^(NSDictionary *param) {
        @strongify(self);
        NSString *leftText = @"";
        if (self.paramConfig[kMWPFixedListConfigLeftText]) {
            leftText = [NSString stringWithFormat:@"%@", self.paramConfig[kMWPFixedListConfigLeftText]];
        }
        self.leftLabel.text = leftText;
        
        NSString *rightText = @"";
        if (self.paramConfig[kMWPFixedListConfigRightText]) {
            rightText = [NSString stringWithFormat:@"%@", self.paramConfig[kMWPFixedListConfigRightText]];
        }
        self.rightLabel.text = rightText;
    }];
}


@end

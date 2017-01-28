//
//  MWPDefaultCell.m
//  RehabDoctor
//
//  Created by dingrui on 2017/1/23.
//  Copyright © 2017年 Baidu. All rights reserved.
//

#import "MWPLeftRightNextCell.h"
#import "MWPBaseFixedListMacro.h"
#import "ReactiveCocoa.h"
#import "MWPBaseCellNextIcon.h"

@interface MWPLeftRightNextCell()

@end

@implementation MWPLeftRightNextCell

- (void)setupView {
    [super setupView];
    self.nextIcon = [[MWPBaseCellNextIcon alloc]initWithBaseCell:self];
    [self.contentView addSubview:self.nextIcon];
}

@end

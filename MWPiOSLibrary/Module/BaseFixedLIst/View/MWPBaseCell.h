//
//  MWPBaseCell.h
//  MWPiOSLibrary
//
//  Created by dingrui on 2017/1/19.
//  Copyright © 2017年 lmule. All rights reserved.
//

typedef void(^TargetSelectBlock)();

#import "MWPBaseFixedListMacro.h"

/**
 行数固定的cell，一般用于”个人中心“、”菜单“等
 字典配置demo（具体的key和默认值详见“MWPBaseFixedListMacro.h”）:
 {
    'default' : {
        'identifier' : ''（如果不填，默认是MWPBaseCell）
        'rowHeight' : ''（如果不填，默认是44）
    },
    'items' : [
        {
            'identifier' : ''
            'rowHeight' : ''
            'target' : 'TestViewController'（如果target是字符串，则跳转到字符串对应的ViewController，否则执行每个MWPBaseCell子类的target）
            'param' : {
                'a' : 1
            }（传给每个cell的参数，每个cell可自由使用）
        }
    ]
 }
 */
@interface MWPBaseCell : UITableViewCell

/**
 加入默认值处理后的字典配置
 */
@property (nonatomic, strong) NSDictionary *dataItemConfig;

/**
 需要额外传入的参数
 */
@property (nonatomic, strong) NSDictionary *paramConfig;

/**
 行高
 */
@property (nonatomic, assign) CGFloat rowHeight;

/**
 点击需要跳转到的ViewController
 */
@property (nonatomic, strong) NSString *targetViewController;

/**
 点击执行的block
 */
@property (nonatomic, copy) TargetSelectBlock targetBlock;

- (void)setupView;

@end

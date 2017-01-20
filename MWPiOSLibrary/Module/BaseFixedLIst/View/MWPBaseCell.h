//
//  MWPBaseCell.h
//  MWPiOSLibrary
//
//  Created by dingrui on 2017/1/19.
//  Copyright © 2017年 lmule. All rights reserved.
//

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

@property (nonatomic, assign) CGFloat rowHeight;

/**
 如果是字符串，直接跳转到该ViewController
 否则直接执行target里面block
 */
@property (nonatomic, strong) id target;

/**
 将字典配置转换成MWPBaseCell对象，方便外界使用

 @param dataItem 字典配置
 @return MWPBaseCell对象
 */
+ (MWPBaseCell *)setupWithDataItem:(NSDictionary *)dataItem;

- (void)setupView;

@end

//
//  MWPBaseModel.h
//  MWPiOSLibrary
//
//  Created by dingrui on 2017/1/1.
//  Copyright © 2017年 lmule. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface MWPBaseModel : JSONModel

/**
 *  错误码
 */
@property (nonatomic, strong) NSString<Optional> *errorCode;

/**
 *  错误信息
 */
@property (nonatomic, strong) NSString<Optional> *errorMessage;

/**
 *  数据
 */
@property (nonatomic, strong) id<Optional> data;

@end

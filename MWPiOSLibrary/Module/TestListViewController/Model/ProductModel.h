//
//  ProductModel.h
//  MWPiOSLibrary
//
//  Created by dingrui on 2017/1/2.
//  Copyright © 2017年 lmule. All rights reserved.
//

#import "MWPBaseModel.h"

@protocol ProductModel <NSObject>


@end

@interface TestModel : MWPBaseModel

@property (nonatomic, strong) NSArray<ProductModel> *data;

@end


@interface ProductModel : JSONModel
@property (nonatomic, copy) NSString *main_title;
@end

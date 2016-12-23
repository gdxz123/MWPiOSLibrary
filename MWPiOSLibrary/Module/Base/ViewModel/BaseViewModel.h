//
//  BaseViewModel.h
//  MVVM
//
//  Created by develop on 15/9/23.
//  Copyright © 2015年 songhailiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface BaseViewModel : NSObject

@property (nonatomic) RACSubject *errorSignal;

@property (nonatomic) RACSubject *willDisappearSignal;

@end

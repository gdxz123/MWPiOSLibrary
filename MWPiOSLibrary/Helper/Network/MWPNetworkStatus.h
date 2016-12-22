//
//  MWPNetwork.h
//  MWPiOSLibrary
//
//  Created by dingrui on 2016/12/19.
//  Copyright © 2016年 lmule. All rights reserved.
//

#import "Reachability.h"

@interface MWPNetworkStatus : NSObject

/**
 *  是否能上网
 */
@property (nonatomic, assign) BOOL isOnline;

/**
 *  是否用无线上网
 */
@property (nonatomic, assign) BOOL isWifi;

/**
 *  是否用流量上网
 */
@property (nonatomic, assign) BOOL isCellular;

/**
 *  单例
 *
 *  @return 网络单例
 */
+ (MWPNetworkStatus *)sharedInstance;

/**
 *  开始监控网络是否可用
 */
- (RACSignal *)startMonitoringReachability;

@end

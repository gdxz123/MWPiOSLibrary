//
//  MWPNetwork.m
//  MWPiOSLibrary
//
//  Created by dingrui on 2016/12/19.
//  Copyright © 2016年 lmule. All rights reserved.
//

#import "MWPNetworkStatus.h"

@interface MWPNetworkStatus()

@property (nonatomic, assign) NetworkStatus networkStatus;

@end

@implementation MWPNetworkStatus

SHARED_INSTANCE(MWPNetworkStatus);

/**
 *  开始监控网络是否可用
 */
- (RACSignal *)startMonitoringReachability {
    
    //使用通知中心监听kReachabilityChangedNotification通知
    [[NSNotificationCenter defaultCenter]
        addObserver:self
        selector:@selector(reachabilityChanged:)
        name:kReachabilityChangedNotification object:nil];
    
    /*
     曾经尝试用过https://github.com/CodaFi/AFNetworking-RACExtensions里面测试网络状态的例子，但总是返回网络不可用，提了个issue(https://github.com/CodaFi/AFNetworking-RACExtensions/issues/55)也没人鸟
     所以用了Reachability
     */
    
    //获取访问指定站点的Reachability对象
    Reachability *reachability = [Reachability reachabilityWithHostName:@"www.baidu.com"];
    //让Reachability对象开启被监听状态
    [reachability startNotifier];
    
    /*
     每次网络状态变化发kReachabilityChangedNotification这个通知的时候，都会调用两次reachabilityChanged（这好像是官方的bug），每次调用时间间隔很短，所以使用throttle延迟1秒来避免这个sideeffect
     第一次执行reachabilityChanged的时候，第一次返回NotReachable，第二次会返回正常的网络状态
     第一次以后执行reachabilityChanged的时候，两次都会返回相同的网络状态，所以使用distinctUntilChanged来避免调用两次
     */
    return [[RACObserve(self, isOnline) distinctUntilChanged] throttle:1];
}

/**
 *  每次网络状态切换的时候发送通知执行的回调
 *
 *  @param notification 通知对象
 */
- (void)reachabilityChanged:(NSNotification *)notification {
    
    //通过通知对象获取被监听的Reachability对象
    Reachability *reachability = [notification object];
    //获取Reachability对象的网络状态
    self.networkStatus = [reachability currentReachabilityStatus];
    
    switch (self.networkStatus) {
        case NotReachable:
            self.isOnline = NO;
            self.isWifi = NO;
            self.isCellular = NO;
            break;
        case ReachableViaWiFi:
            self.isOnline = YES;
            self.isWifi = YES;
            self.isCellular = NO;
            break;
        case ReachableViaWWAN:
            self.isOnline = YES;
            self.isWifi = NO;
            self.isCellular = YES;
        default:
            break;
    }
    
}

@end

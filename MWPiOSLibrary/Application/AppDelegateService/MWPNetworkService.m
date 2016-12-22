//
//  MWPNetworkService.m
//  MWPiOSLibrary
//
//  Created by dingrui on 2016/12/19.
//  Copyright © 2016年 lmule. All rights reserved.
//

#import "MWPNetworkService.h"
#import "MWPNetworkStatus.h"

@implementation MWPNetworkService

ML_EXPORT_SERVICE(MWPNetworkService)

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    RACSignal *networkSignal = [[MWPNetworkStatus sharedInstance] startMonitoringReachability];
    [networkSignal subscribeNext:^(NSNumber *status) {
        if (status.boolValue == YES) {
            NSLog(@"能上网啦");
        }
        else {
            NSLog(@"没网拉");
        }
    }];
    return YES;
    
}

@end

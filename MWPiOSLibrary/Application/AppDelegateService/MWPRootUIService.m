//
//  MWPRootUIService.m
//  MWPiOSLibrary
//
//  Created by dingrui on 2016/12/16.
//  Copyright © 2016年 lmule. All rights reserved.
//

#import "MWPRootUIService.h"
#import "ProductListViewController.h"
#import "FixedPlainListViewController.h"

@implementation MWPRootUIService

ML_EXPORT_SERVICE(MWPRootUIService)

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    application.delegate.window = window;
    
//    RAFNMainViewController* dvc = [[RAFNMainViewController alloc] init];
    FixedPlainListViewController * dvc = [[FixedPlainListViewController alloc] init];
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController:dvc];
    window.rootViewController = nav;
    [window makeKeyAndVisible];
    
    return YES;
    
}

@end

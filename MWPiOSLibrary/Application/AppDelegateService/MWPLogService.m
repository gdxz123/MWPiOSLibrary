
//  LogService.m
//  MWPiOSLibrary
//
//  Created by dingrui on 2016/12/16.
//  Copyright © 2016年 lmule. All rights reserved.
//

#import "MWPLogService.h"

@implementation MWPLogService

ML_EXPORT_SERVICE(MWPLogService)

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //开启使用 XcodeColors
    setenv("XcodeColors", "YES", 0);
    //检测
    char *xcode_colors = getenv("XcodeColors");
    if (xcode_colors && (strcmp(xcode_colors, "YES") == 0)) {
        // XcodeColors is installed and enabled!
        // NSLog(@"XcodeColors is installed and enabled");
    }
    
    DDTTYLogger *logger = [DDTTYLogger sharedInstance];
    logger.logFormatter = [[MWPDDLogFormatter alloc]init];
    [DDLog addLogger:logger];
    
    [logger setColorsEnabled:YES];
    //正常情况下，只需要关注warning、error的日志，所以只对这两种level设置背景色即可
    [logger setForegroundColor:[UIColor purpleColor] backgroundColor:[UIColor lightGrayColor] forFlag:DDLogFlagWarning];
    [logger setForegroundColor:[UIColor redColor] backgroundColor:[UIColor whiteColor] forFlag:DDLogFlagError];
    
    return YES;
    
}

@end

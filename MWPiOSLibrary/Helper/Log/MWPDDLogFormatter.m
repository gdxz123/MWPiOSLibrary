//
//  MWPDDLogFormatter.m
//  MWPiOSLibrary
//
//  Created by dingrui on 2016/12/15.
//  Copyright © 2016年 lmule. All rights reserved.
//

#import "MWPDDLogFormatter.h"

@implementation MWPDDLogFormatter

- (NSString *)formatLogMessage:(DDLogMessage *)logMessage {
    NSString *logLevel = nil;
    switch (logMessage.flag)
    {
        case DDLogFlagError:
            logLevel = @"[ERROR]";
            break;
        case DDLogFlagWarning:
            logLevel = @"[WARNING]";
            break;
        case DDLogFlagInfo:
            logLevel = @"[INFO]";
            break;
        case DDLogFlagDebug:
            logLevel = @"[DEBUG]";
            break;
        default:
            logLevel = @"[VERBOSE]";
            break;
    }
    
    NSString *formatStr = [NSString stringWithFormat:@"%@%@:%lu->%@",
                           logLevel, logMessage.function,
                           (unsigned long)logMessage.line, logMessage.message];
    return formatStr;
}

@end

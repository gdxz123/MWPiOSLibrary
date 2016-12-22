//
//  MWPDDLogFormatter.h
//  MWPiOSLibrary
//
//  Created by dingrui on 2016/12/15.
//  Copyright © 2016年 lmule. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CocoaLumberjack/CocoaLumberjack.h>

@interface MWPDDLogFormatter : NSObject<DDLogFormatter>

- (NSString *)formatLogMessage:(DDLogMessage *)logMessage;

@end

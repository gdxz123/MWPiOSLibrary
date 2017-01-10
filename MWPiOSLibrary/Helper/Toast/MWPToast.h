//
//  MWPToast.h
//  MWPiOSLibrary
//
//  Created by dingrui on 2017/1/7.
//  Copyright © 2017年 lmule. All rights reserved.
//

#import "MBProgressHUD+BWMExtension.h"

@interface MWPToast : NSObject

+ (void)showHUD;

+ (void)showTitle:(NSString *)title;

+ (void)showTitle:(NSString *)title hideAfter:(NSTimeInterval)afterSecond;

+ (void)showTitle:(NSString *)title hideAfter:(NSTimeInterval)afterSecond msgType:(BWMMBProgressHUDMsgType)msgType;

+ (void)hideAllHUDs;

@end

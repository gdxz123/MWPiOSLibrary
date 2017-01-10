//
//  MWPToast.m
//  MWPiOSLibrary
//
//  Created by dingrui on 2017/1/7.
//  Copyright © 2017年 lmule. All rights reserved.
//

#import "MWPToast.h"

@implementation MWPToast

+ (void)showHUD {
    [MBProgressHUD showHUDAddedTo:[MWPToast getViewOfUIWindow] animated:YES];
}

+ (void)showTitle:(NSString *)title {
    [MBProgressHUD bwm_showTitle:title toView:[MWPToast getViewOfUIWindow] hideAfter:1.0];
}

+ (void)showTitle:(NSString *)title hideAfter:(NSTimeInterval)afterSecond {
    [MBProgressHUD bwm_showTitle:title toView:[MWPToast getViewOfUIWindow] hideAfter:afterSecond];
}

+ (void)showTitle:(NSString *)title hideAfter:(NSTimeInterval)afterSecond msgType:(BWMMBProgressHUDMsgType)msgType {
    [MBProgressHUD bwm_showTitle:title toView:[MWPToast getViewOfUIWindow] hideAfter:afterSecond msgType:msgType];
}

+ (void)hideAllHUDs {
    [MBProgressHUD hideAllHUDsForView:[MWPToast getViewOfUIWindow] animated:YES];
}

+ (UIView *)getViewOfUIWindow {
    UIApplication *application = [UIApplication sharedApplication];
    if (application.windows.count > 1) {
        return application.windows[1];
    }
    return application.keyWindow;
}

@end

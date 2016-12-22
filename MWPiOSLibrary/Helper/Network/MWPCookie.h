//
//  MWPCookie.h
//  MWPiOSLibrary
//
//  Created by dingrui on 16/2/11.
//  Copyright © 2016年 lmule. All rights reserved.
//

//#import <Foundation/Foundation.h>
//
//@interface MWPCookie : NSObject
//
///**
// *  根据plist文件 初始化MWPCookie，plist文件中必须包含Cookie的键
// *
// *  @param plist文件前缀
// *
// *  @return MWPCookie
// */
//- (instancetype)initWithPlistFile:(NSString *)plistFileName;
//
///**
// *  根据域名、过期时间、路径、版本 初始化MWPCookie
// *
// *  @param domain     域名
// *  @param expireDate 绝对过期时间
// *  @param path       路径
// *  @param version    版本
// *
// *  @return MWPCookie
// */
//- (instancetype)initWithDomain:(NSString *)domain expireDate:(NSDate *)expireDate path:(NSString *)path version:(NSString *)version;
//
///**
// *  根据域名和绝对过期时间 初始化MWPCookie，路径默认是/，版本默认是0
// *
// *  @param domain     域名
// *  @param expireDate 绝对过期时间
// *
// *  @return MWPCookie
// */
//- (instancetype)initWithDomain:(NSString *)domain expireDate:(NSDate *)expireDate;
//
///**
// *  根据域名、绝对过期时间 设置NSHTTPCookie的基本属性
// *
// *  @param domain     域名
// *  @param expireDate 绝对过期时间
// *
// *  @return NSHTTPCookie的基本属性
// */
//+ (NSMutableDictionary *)setupCookieProperty:(NSString *)domain expireDate:(NSDate *)expireDate;
//
///**
// *  根据域名、绝对过期时间、路径、版本 设置NSHTTPCookie的基本属性
// *
// *  @param domain     域名
// *  @param expireDate 绝对过期时间
// *  @param path       路径
// *  @param version    版本
// *
// *  @return  NSHTTPCookie的基本属性
// */
//+ (NSMutableDictionary *)setupCookieProperty:(NSString *)domain expireDate:(NSDate *)expireDate path:(NSString *)path version:(NSString *)version;
//
///**
// *  调用完setupCookieProperty之后，设置cookie的key、value
// *
// *  @param key   key
// *  @param value value
// */
//- (void)addCookieKeyValue:(NSString *)key value:(NSString *)value;
//
///**
// *  根据plist文件中指定domain获取NSHTTPCookie集合
// *
// *  @return NSHTTPCookie集合
// */
//- (NSArray <NSHTTPCookie *> *)getHTTPCookies;
//
///**
// *  根据指定域名获取NSHTTPCookie集合
// *
// *  @param domain 指定域名
// *
// *  @return NSHttpCookie集合
// */
//+ (NSArray <NSHTTPCookie *> *)getHTTPCookiesWithDomain:(NSString *)domain;
//@end

//
//  MWPCookie.m
//  MWPiOSLibrary
//
//  Created by dingrui on 2016/12/18.
//  Copyright © 2016年 lmule. All rights reserved.
//

//#import "MWPCookie.h"
//#import "MWPMacro.h"
//
//@interface MWPCookie()
//
//@property (nonatomic, strong) NSMutableDictionary *cookieDict;
//
//@property (nonatomic, strong) NSDictionary *cookieDictionaryOfPlist;
//
////cookie默认path
//#define kDefaultCookiePath @"/"
//
////cookie默认version
//#define kDefaultCookieVersion @"0"
//
////plist文件中默认的cookie key
//#define kPlistCookieCookieKey @"Cookie"
//
////plist文件中默认的cookie domain
//#define kPlistCookieCookieDomain @"domain"
//
////plist文件中默认的cookie path
//#define kPlistCookieCookiePath @"path"
//
////plist文件中默认的cookie version
//#define kPlistCookieCookieVersion @"version"
//
////plist文件中默认的cookie expire
//#define kPlistCookieCookieExpire @"expire"
//
//@end
//
//@implementation MWPCookie
//
//#pragma mark - ==初始化==
//
///**
// *  根据plist文件 初始化MWPCookie，plist文件中必须包含Cookie的键
// *
// *  @param plist文件前缀
// *
// *  @return MWPCookie
// */
//- (instancetype)initWithPlistFile:(NSString *)plistFileName {
//    if (!plistFileName) {
//        plistFileName = @"Info";
//    }
//    NSString *plistFilePath = [[NSBundle mainBundle]pathForResource:plistFileName ofType:@"plist"];
//    NSDictionary *plistDict = [[NSDictionary alloc]initWithContentsOfFile:plistFilePath];
//    if (!plistFilePath) {
//        DDLogError(@"%@.plist does not exist", plistFilePath);
//        return nil;
//    }
//    
//    self.cookieDictionaryOfPlist = plistDict[kPlistCookieCookieKey];
//    if (!self.cookieDictionaryOfPlist) {
//        DDLogError(@"%@.plist does not contain key named %@", plistFilePath, kPlistCookieCookieKey);
//        return nil;
//    }
//    
//    NSDate *expireDate = [[NSDate date]dateByAddingTimeInterval:[self.cookieDictionaryOfPlist[kPlistCookieCookieExpire] intValue]];
//    return [self initWithDomain:self.cookieDictionaryOfPlist[kPlistCookieCookieDomain] expireDate:expireDate path:self.cookieDictionaryOfPlist[kPlistCookieCookiePath] version:self.cookieDictionaryOfPlist[kPlistCookieCookieVersion]];
//}
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
//- (instancetype)initWithDomain:(NSString *)domain expireDate:(NSDate *)expireDate path:(NSString *)path version:(NSString *)version {
//    if (!(self = [super init])) {
//        return self;
//    }
//    
//    self.cookieDict = [MWPCookie setupCookieProperty:domain expireDate:expireDate path:path version:version];
//    return self;
//}
//
///**
// *  根据域名和绝对过期时间 初始化MWPCookie，路径默认是/，版本默认是0
// *
// *  @param domain     域名
// *  @param expireDate 绝对过期时间
// *
// *  @return MWPCookie
// */
//- (instancetype)initWithDomain:(NSString *)domain expireDate:(NSDate *)expireDate {
//    return [self initWithDomain:domain expireDate:expireDate path:kDefaultCookiePath version:kDefaultCookieVersion];
//}
//
//+ (NSMutableDictionary *)setupCookieProperty:(NSString *)domain expireDate:(NSDate *)expireDate path:(NSString *)path version:(NSString *)version {
//    NSMutableDictionary *cookieProperty = [NSMutableDictionary dictionary];
//    
//    cookieProperty[NSHTTPCookieDomain] = domain;
//    cookieProperty[NSHTTPCookiePath] = path;
//    cookieProperty[NSHTTPCookieVersion] = version;
//    cookieProperty[NSHTTPCookieExpires] = expireDate;
//    
//    return cookieProperty;
//}
//
//#pragma mark - ==设置基本属性==
//
///**
// *  根据域名、绝对过期时间 设置NSHTTPCookie的基本属性
// *
// *  @param domain     域名
// *  @param expireDate 绝对过期时间
// *
// *  @return NSHTTPCookie的基本属性
// */
//+ (NSMutableDictionary *)setupCookieProperty:(NSString *)domain expireDate:(NSDate *)expireDate {
//    return [MWPCookie setupCookieProperty:domain expireDate:expireDate path:kDefaultCookiePath version:kDefaultCookieVersion];
//}
//
//#pragma mark - ==增加cookie==
//
///**
// *  调用完setupCookieProperty之后，设置cookie的key、value
// *
// *  @param key   key
// *  @param value value
// */
//- (void)addCookieKeyValue:(NSString *)key value:(NSString *)value {
//    self.cookieDict[NSHTTPCookieName] = key;
//    self.cookieDict[NSHTTPCookieValue] = value;
//    
//    NSHTTPCookie *cookie = [NSHTTPCookie cookieWithProperties:self.cookieDict];
//    [[NSHTTPCookieStorage sharedHTTPCookieStorage]setCookie:cookie];
//}
//
//#pragma mark - ==获取cookie==
//
///**
// *  根据plist文件中指定domain获取NSHTTPCookie集合
// *
// *  @return NSHTTPCookie集合
// */
//- (NSArray <NSHTTPCookie *> *)getHTTPCookies {
//    NSString *domain = [NSString stringWithFormat:@"http://%@", self.cookieDictionaryOfPlist[kPlistCookieCookieDomain]];
//    return [MWPCookie getHTTPCookiesWithDomain:domain];
//}
//
///**
// *  根据指定域名获取NSHTTPCookie集合
// *
// *  @param domain 指定域名
// *
// *  @return NSHttpCookie集合
// */
//+ (NSArray <NSHTTPCookie *> *)getHTTPCookiesWithDomain:(NSString *)domain {
//    return [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL:[NSURL URLWithString:domain]];
//}
//
//@end

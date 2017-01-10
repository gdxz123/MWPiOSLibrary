
#pragma mark ==== 获取数据的后端host ====

//后端host
#if DEBUG
#define kServerHost @"http://www.mr-hug.com"
#else
#define kServerHost @""
#endif

#pragma mark ==== 和cookie有关的配置(暂时不用，和后端通信主要通过access-token) ====

#define kCookieDefaultDomain kServerHost
#define kCookieDefaultPath @"/"
#define kCookieDefaultVersion 0
#define kCookieDefaultExpire 86400

#pragma mark ==== API ====

#define kProductList kServerHost@"/product/ajax-list"

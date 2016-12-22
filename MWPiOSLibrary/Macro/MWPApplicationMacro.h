
#pragma mark ==== 系统级别 ====

//iOS系统版本
#define SYSTEM_VERSION ([UIDevice currentDevice].systemVersion)

//iOS系统版本(浮点型)
#define SYSTEM_VERSION_DOUBLE ([[UIDevice currentDevice].systemVersion doubleValue])

//判断系统版本是否大于指定version
#define SYSTEM_VERSION_GREATER_THAN(version) (SYSTEM_VERSION_DOUBLE >= version)

//版本是否大于7.0
#define IS_IOS7 SYSTEM_VERSION_GREATER_THAN(7.0)

//版本是否大于8.0
#define IS_IOS8 SYSTEM_VERSION_GREATER_THAN(8.0)

//屏幕宽度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)

//屏幕高度
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

//App名称
#define APP_NAME [[[NSBundle mainBundle]infoDictionary] objectForKey:@"CFBundleName"]

//当前发布版本
#define APP_RELEASE_VERSION [[[NSBundle mainBundle]infoDictionary] objectForKey:@"CFBundleShortVersionString"]

//当前Build版本
#define APP_BUILD_VERSION [[[NSBundle mainBundle]infoDictionary] objectForKey:@"CFBundleVersion"]

//当前App版本
#define APP_VERSION APP_RELEASE_VERSION

//为了和安卓区分的iOS系统标识
#define PLATFORM @"ios"

#pragma mark ==== 语种 ====

//当前语种
#define LANGUAGE ([[NSLocale preferredLanguages] objectAtIndex:0])

#pragma mark ==== 常用函数宏 ====

//将一个对象单例化
#define SHARED_INSTANCE(className) \
+ (className *)sharedInstance{ \
static dispatch_once_t onceToken;\
static id instance;\
dispatch_once(&onceToken, ^{ \
instance = [[self alloc] init]; \
}); \
return instance; \
}

#pragma mark ==== 日志相关 ====

//指定调试级别
#ifdef DEBUG
static const DDLogLevel ddLogLevel = DDLogLevelVerbose;
#else
static const DDLogLevel ddLogLevel = DDLogLevelWarning;
#endif

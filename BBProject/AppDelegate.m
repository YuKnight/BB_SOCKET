//
//  AppDelegate.m
//  BBProject
//
//  AppDelegate 生命周期
//  第一个iOS程序[517:c07] didFinishLaunchingWithOptions--加载完毕
//  第一个iOS程序[517:c07] applicationDidBecomeActive-----获取焦点
//  按下home键：
//  第一个iOS程序[517:c07] applicationWillResignActive----失去焦点
//  第一个iOS程序[517:c07] applicationDidEnterBackground--进入后台
//  再按程序：
//  第一个iOS程序[517:c07] applicationWillEnterForeground-进入前台
//  第一个iOS程序[517:c07] applicationDidBecomeActive-----获取焦点

//  Created by qthd on 16/1/12.
//  Copyright © 2016年 蜻蜓互动. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"

@interface AppDelegate ()
- (void)addDDLog;     //加载DDLog
- (void)registerAPNS; //注册APNS
@end

@implementation AppDelegate

#pragma mark - didFinishLaunchingWithOptions 在应用程序加载完毕之后调用
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    [self addDDLog];                     //加载DDLog
    [self registerAPNS];                 //注册APNS
    [NSThread sleepForTimeInterval:2.0]; //开机画面延迟2秒
    
    LoginViewController *loginViewController = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
    self.window.rootViewController = loginViewController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

#pragma mark - applicationWillResignActive 程序失去焦点的时候调用（不能跟用户进行交互了）
- (void)applicationWillResignActive:(UIApplication *)application
{
    DDLogInfo(@"applicationWillResignActive ---- 失去焦点!");
    
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

#pragma mark - applicationDidEnterBackground 当应用程序进入后台的时候调用（点击Home键）
- (void)applicationDidEnterBackground:(UIApplication *)application
{
    DDLogInfo(@"applicationDidEnterBackground ---- 点击Home进入后台！");
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

#pragma mark - applicationWillEnterForeground 当应用程序进入前台的时候调用
- (void)applicationWillEnterForeground:(UIApplication *)application
{
    DDLogInfo(@"applicationWillEnterForeground ---- 进入前台！");
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

#pragma mark - applicationDidBecomeActive 当应用程序获取焦点的时候调用
- (void)applicationDidBecomeActive:(UIApplication *)application
{
    DDLogInfo(@"applicationDidBecomeActive ---- 获取焦点！");
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

#pragma mark - applicationWillTerminate 程序在某些情况下被终结时会调用这个方法
- (void)applicationWillTerminate:(UIApplication *)application
{
    DDLogInfo(@"applicationWillTerminate ---- 被关闭！");
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - didRegisterForRemoteNotificationsWithDeviceToken 推送通知DeviceToken
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    NSString *token = [[[[deviceToken description]
                         stringByReplacingOccurrencesOfString: @"<" withString: @""]
                         stringByReplacingOccurrencesOfString: @">" withString: @""]
                         stringByReplacingOccurrencesOfString: @" " withString: @""];
    BBLocalCache.token = token;
    DDLogInfo(@"设备的token是：%@", token);
}

#pragma mark - didFailToRegisterForRemoteNotificationsWithError 推送通知错误
- (void)application:(UIApplication *)app didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    NSString *errorDescription = [NSString stringWithFormat: @"%@\n%@", error.description, error.debugDescription];
    DDLogInfo(@"获取token失败，错误码是: %@", errorDescription);
}

#pragma mark - 其他方法

#pragma mark - addDDLog 加载DDLog
- (void)addDDLog
{
    [DDLog addLogger:[DDTTYLogger sharedInstance]];         //初始化DDLog
    DDFileLogger *fileLogger = [[DDFileLogger alloc] init]; //只需要初始化一次
    fileLogger.rollingFrequency = 60 * 60 * 24;             //每天一个文件
    fileLogger.logFileManager.maximumNumberOfLogFiles = 7;  //Log文件最多允许7个
    [DDLog addLogger:fileLogger];
    [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
    //测试数据
//    DDLogInfo(@"文件路径： %@", fileLogger.logFileManager.logsDirectory);
//    DDLogWarn(@"测试Warn数据： %@", @"测试DDLog保存文件的正确性！");
//    DDLogError(@"测试Error数据： %@", @"测试DDLog保存文件的正确性！");
}

#pragma mark - registerAPNS 注册APNS （iOS8和之前版本的注册方式有区别）
- (void)registerAPNS
{
    if ([NSString isEmptyOrNull:BBLocalCache.token])
    { //如果没有取到token
        if (IS_IOS8)
        {
            UIUserNotificationType types = UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
            [[UIApplication sharedApplication] registerForRemoteNotifications];
            UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
            [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
        }
        else
        {
            [[UIApplication sharedApplication] registerForRemoteNotificationTypes:UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert];
        }
        
        DDLogInfo(@"registerAPNS 注册通知~~~~");
    }
}

@end

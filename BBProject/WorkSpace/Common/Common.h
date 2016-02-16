//
//  Common.h
//  BBProject
//
//  Created by qthd on 16/1/14.
//  Copyright © 2016年 蜻蜓互动. All rights reserved.
//

#import "LocalCache.h"           //本地持久化
#import "SocketManager.h"        //socket
#import "SocketDespatchCenter.h" //socket调度中心
#import "HttpManager.h"          //http

#ifndef Common_h
#define Common_h

//获得屏幕尺寸
#define SCREEN_SIZE ([UIScreen mainScreen].bounds.size)
#define SCREEN_H ([UIScreen mainScreen].bounds.size.height)
#define SCREEN_W ([UIScreen mainScreen].bounds.size.width)
#define START_Y 64.0f //如果有navigationView，那么view的起始高度为64

//判断设备
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

//是否retina屏
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0f)

//手机型号
#define IS_IPHONE_4s (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0f)
#define IS_IPHONE_5  (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0f)
#define IS_IPHONE_6  (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0f)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0f)

//iOS8以上系统
#define IS_IOS8 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0f)

//本地持久化单利对象
#define BBLocalCache ([LocalCache shareLocalCache])

//socket_tcp单例对象
#define BBSocketManager ([SocketManager shareSocketManager])
#define BBSocketDespatchCenter ([SocketDespatchCenter shareSocketDespatchCenter])

//http请求单例对象
#define HTTP_RESULT_SUCCEED 0 //请求成功标志
#define BBHttpManager ([HttpManager shareHttpManager])

//内部标示 用以记录开发版本的，每次更新的时候都需要比上一次高
#define APP_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
//发布版本号 如当前上架版本为1.1.0  之后你更新的时候可以改为1.1.1
#define APP_SHORT_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

#endif /* Common_h */

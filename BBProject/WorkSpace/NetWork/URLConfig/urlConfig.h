//
//  urlConfig.h
//  BBProject
//
//  Created by qthd on 20/1/19.
//  Copyright © 2016年 蜻蜓互动. All rights reserved.
//

#import <AssetsLibrary/AssetsLibrary.h>

#pragma mark -   0：开发环境   1：测试环境   2：生产环境
#define DEV_DEBUG 1

#if DEV_DEBUG == 0

    #define SERVICE_IP            @"ws://192.168.1.12:8100"                    //.net开发环境

#elif DEV_DEBUG == 1

    #define BB_URL_ROOT           @"http://119.147.71.84:19801"
    #define URL_ROOT_ZONE         @"http://119.147.71.84:19801/zone"           //发现
    #define URL_ROOT_LOGIN        @"http://119.147.71.84:19801/login"          //登陆服务
    #define URL_ROOT_UPGRADE      @"http://119.147.71.84:19801/upgrade"        //升级服务
    #define URL_ROOT_CLASS        @"http://119.147.71.84:19801/httpclass"      //班级服务
    #define URL_ROOT_BEAN         @"http://119.147.71.84:19801/bean"           //青豆服务
    #define URL_ROOT_ACCOUNT      @"http://119.147.71.84:19801/classaccount"   //班费
    #define URL_CLASSFEECARD_ROOT @"http://119.147.71.84:19801/classfeecard"   //班费卡服务
    #define URL_ROOT_CLASS_APPLY  @"http://119.147.71.84:19801/audit"          //加入班级的动态审核
    #define APP_ROOT              @"http://newxxdemo.qtxiaoxin.com/mobile/"    //php我的青豆、使用帮助、班费介绍
    #define SHOP_ROOT             @"http://119.147.71.81:99/api.aspx?"         //商城
    #define URL_OMS               @"http://119.147.71.84:19801/omsproxy"       //oms代理服务
    #define MALL_ROOT             @"http://mall.qtxiaoxin.com"                 //班班商城
    #define BB_NOTICE_URL_ROOT    @"newxxdemo.qtxiaoxin.com/index.php/api/app" //php通知测试环境.七牛

#elif DEV_DEBUG == 2

    #define BB_URL_ROOT           @"http://http.banban.im:19801"
    #define URL_ROOT_ZONE         @"http://http.banban.im:19801/zone"          //发现
    #define URL_ROOT_LOGIN        @"http://http.banban.im:19801/login"         //登陆服务
    #define URL_ROOT_UPGRADE      @"http://http.banban.im:19801/upgrade"       //升级服务
    #define URL_ROOT_CLASS        @"http://http.banban.im:19801/httpclass"     //班级服务
    #define URL_ROOT_BEAN         @"http://http.banban.im:19801/bean"          //青豆服务
    #define URL_ROOT_ACCOUNT      @"http://http.banban.im:19801/classaccount"  //班费
    #define URL_CLASSFEECARD_ROOT @"http://http.banban.im:19801/classfeecard"  //班费卡服务
    #define URL_ROOT_CLASS_APPLY  @"http://http.banban.im:19801/audit"         //加入班级的动态审核
    #define APP_ROOT              @"http://web.banban.im/mobile/"              //php我的青豆、使用帮助、班费介绍
    #define SHOP_ROOT             @"http://shop.banban.im/api.aspx?"           //商城
    #define URL_OMS               @"http://http.banban.im:19801/omsproxy"      //oms代理服务，正式环境
    #define MALL_ROOT             @"http://mall.banban.im"                     //班班商城服务，正式环境
    #define BB_NOTICE_URL_ROOT    @"newxxdemo.qtxiaoxin.com/index.php/api/app" //php通知测试环境.七牛

#endif

#define  BB_NOTICE_URL(action) [NSString stringWithFormat:@"%@%@", BB_NOTICE_URL_ROOT, action]



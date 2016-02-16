
//
//  SocketReadMe.h
//  BBProject
//
//  Created by qthd on 16/2/4.
//  Copyright © 2016年 蜻蜓互动. All rights reserved.
//

#ifndef SocketReadMe_h
#define SocketReadMe_h

/*

**************
   目录介绍：
**************
 
 
 外部调用：
    SocketMain文件夹：外部Socket通信使用唯一入口
 
 内部：
    DataProcess文件夹：Apollo数据的打包解包
    HeartBeat文件夹：心跳包的管理
    BaseTCP文件夹：基础TCP通信
    AutoReconnect文件夹：TCP的自动重连
    SocketError文件夹：Socket错误处理
 
 
**************
 现阶段功能使用：
**************
 
    1、接收SOCKET通信的连接、授权、断开连接 状态 的Notification回调：
 
 
         //SMNOTIFICATION_TCPCONNECTRESULT   \
         SMNOTIFICATION_TCPAUTHRESULT     \
         SMNOTIFICATION_TCPDISCONNECTED
         
         [[NSNotificationCenter defaultCenter] addObserverForName:SMNOTIFICATION_TCPCONNECTRESULT object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
         NSError *error =[[note userInfo] objectForKey:SMNOTIFICATION_TCPDISCONNECTED_KEY];
         NSLog(@"连接结束 %@",error);
         }];
         
         [[NSNotificationCenter defaultCenter] addObserverForName:SMNOTIFICATION_TCPAUTHRESULT object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
         NSError *error =[[note userInfo] objectForKey:SMNOTIFICATION_TCPDISCONNECTED_KEY];
         NSLog(@"授权结束 %@",error);
         }];
         
         [[NSNotificationCenter defaultCenter] addObserverForName:SMNOTIFICATION_TCPDISCONNECTED object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
         NSError *error =[[note userInfo] objectForKey:SMNOTIFICATION_TCPDISCONNECTED_KEY];
         NSLog(@"断开连接 %@",error);
         }];
 
    2、发送SOCKET消息 注册的delegate回调：
       - socketMDelegate_TCPRequestComplete:
                                      Error:
 
    3、TCP的连接 由外部调用：
       - socketM_ContectWithTime:
 
    4、连接成功之后，SocketManager【自动】进行TCP连接的授权、以及心跳包的分发
 
    5、发送TCP数据，，若需要回调，查看上面的第【2】步：
        - socketM_sendWithData:(NSData *)msgData
                       withCMD:(int)CMDID
                  withDelegate:
 
 
*************
   使用参考
*************

     //建立连接
     [[SocketManager shareSocketManager] socketM_ContectWithTime:-1];
 
 
     // 业务数据
     ApolloTReqAuth *auth = [[ApolloTReqAuth alloc] init];
     auth.jce_sVer = APP_SHORT_VERSION;        // 版本号
     auth.jce_nClientType = ApolloCLIENT_TYPE_IOS;
     auth.jce_sDeviceID = @"E9D53B7E-8AE3-408C-BAFF-DE9287096FFD"; // deviceID;
     NSLog(@"auth.jce_sDeviceID %@",auth.jce_sDeviceID);
     auth.jce_sessionCode = ((AppDelegate *)[UIApplication sharedApplication].delegate).loginInfo.jce_sToken;
     auth.jce_timestamp = (long)[[NSDate date] timeIntervalSince1970];
     auth.jce_apnsToken = @"";
     
     //调用SocketManager发送TCP数据数据
     [[SocketManager shareSocketManager] socketM_sendWithData:[auth toData] withCMD:ApolloECLIENT_COMMAND_EMSG_AUTH withDelegate:self];
 
 
*************
   未来扩充：
*************
 
    1、错误码统一：
        如：服务器返回、自动重连相关、用户手动、等
 
    2、自动重连：
        SocketAutoReconnect
        如：弱网断开（心跳包指定时间内无回包）、被服务器断开、网络切换、等
 
    3、分发中心：
        SocketDespatchCenter
        如：缓存处理（DB、文件读写）、CMD错误处理 、等
 
 */


#endif /* SocketReadMe_h */

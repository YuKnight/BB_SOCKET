//
//  SocketManager+PrepareSendData.m
//  BBProject
//
//  Created by qthd on 16/2/2.
//  Copyright © 2016年 蜻蜓互动. All rights reserved.
//

#import "SocketManager+PrepareSendData.h"

#import "NSData+DataLengthTranslate.h"

#import "ApolloTMsgBody.h"
#import "ApolloTClientPackage.h"
#import "ApolloEMSG_TYPE.h"
#import "BBTime.h"
 
@implementation SocketManager (PrepareSendData)



/**
 *  组装TCP通信的数据包
 *
 *  @param msgData 消息体
 *  @param cmdid   协议号
 *
 *  @return data格式的消息包
 */
+ (NSDictionary *)socketP_PrepareSendData:(NSData *)msgData
                                  withCMD:(int)cmdid
{
    //1、封装消息体
    ApolloTMsgBody *msgBody = [[ApolloTMsgBody alloc] init];
    msgBody.jce_nCMDID = cmdid; // 命令字
    msgBody.jce_nMsgType = ApolloEMSG_TYPE_MSGTYPE_REQUEST; // 客户端请求服务器
    if (msgData != nil)
    {
        msgBody.jce_vMsgData = msgData;
    }
    
    //2、封装消息包数据
    ApolloTClientPackage *package = [[ApolloTClientPackage alloc] init];
    
    //用户鉴权,此处一定不能为空，否则APOLO解析将发生异常
    NSString *UID = [[LocalCache shareLocalCache] userID];
    package.jce_uid = UID ? UID : @"";

    //配对号,服务器未使用到，便于本地做缓存管理
    long sequence = [BBTime timestamp]; 
    package.jce_iSequence = sequence;
    
    //填充消息体
    package.jce_msgBody = msgBody;
    
    //3、打包
    NSDictionary *packageDic = [NSDictionary dictionaryWithObjectsAndKeys:[package toData],PREPAREDICKEY_PackageData,[NSString stringWithFormat:@"%ld", (long)sequence],PREPAREDICKEY_PackageSequence, nil];
    
    return packageDic;
}



@end

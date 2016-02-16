//
//  SocketManager+PrepareSendData.h
//  BBProject
//
//  Created by qthd on 16/2/2.
//  Copyright © 2016年 蜻蜓互动. All rights reserved.
//

#import "SocketManager.h"

#define PREPAREDICKEY_PackageSequence @"SP_PackageSequence"
#define PREPAREDICKEY_PackageData     @"SP_PackageData"
#define PREPAREDICKEY_PackageResponse @"SP_PackageResponse"

@interface SocketManager (PrepareSendData)


/**
 *  组装TCP通信的数据包
 *
 *  @param msgData 消息体
 *  @param cmdid   协议号
 *
 *  @return dic格式的消息包: 
 */
+ (NSDictionary *)socketP_PrepareSendData:(NSData *)msgData
                                  withCMD:(int)cmdid;


@end

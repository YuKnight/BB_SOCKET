//
//  SocketManager+ParseReciveData.h
//  BBProject
//
//  Created by qthd on 16/2/2.
//  Copyright © 2016年 蜻蜓互动. All rights reserved.
//

#import "SocketManager.h"

@class ApolloTClientPackage;

@interface SocketManager (ParseReciveData)
 
/**
 *  解析TCP通信的单个数据包
*
 *  @param data TCP层解析的完整数据包
*
*  @return 一个完整的Apollo消息包
*/
+ (ApolloTClientPackage *)socketP_ParseData:(NSData *)data;


@end

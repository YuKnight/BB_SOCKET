//
//  SocketManager+ParseReciveData.m
//  BBProject
//
//  Created by qthd on 16/2/2.
//  Copyright © 2016年 蜻蜓互动. All rights reserved.
//

#import "SocketManager+ParseReciveData.h"

#import "AppDelegate.h"

#import "ApolloTClientPackage.h"
#import "ApolloECLIENT_COMMAND.h"
#import "ApolloTRespAuth.h"

/**
 *  命令执行失败
 */
#define RESULT_FAILED  -999



@implementation SocketManager (ParseReciveData)


#pragma mark - 解析TCP数据，并分发处理


/**
 *  解析TCP通信的单个数据包
 *
 *  @param data TCP层解析的完整数据包
 *
 *  @return 一个完整的Apollo消息包
 */
+ (ApolloTClientPackage *)socketP_ParseData:(NSData *)data
{
    if([data length] < 1)
        return nil;
    
    //消息解包
    ApolloTClientPackage *package = [[ApolloTClientPackage alloc] init];
    [package fromData:data];
    
    return package;
}




@end

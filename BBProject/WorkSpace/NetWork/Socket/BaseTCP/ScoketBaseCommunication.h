//
//  ScoketBaseCommunication.h
//  BBProject
//
//  Created by qthd on 16/1/28.
//  Copyright © 2016年 蜻蜓互动. All rights reserved.
//
/**
    管理TCP基础通信,主要功能：
 
    1、TCP的连接
    2、TCP的断开
    3、TCP连接状态
    4、发送消息
    5、接收消息，并将已解析的完整包分发给业务层
 */

#import <Foundation/Foundation.h>
#import "ScoketBaseCommunicationDelegate.h"

  
@interface ScoketBaseCommunication : NSObject

#pragma mark - TCP的连接

#ifdef DEBUG
/**
 *  启动TCP链接
 *
 *  @param errPtr
 *
 *  @return 若本地错误会实时返回NO
 */
- (BOOL)socketBC_Connect:(NSError **)errPtr;
#endif

/**
*  由外部传入，增加其灵活性
*
*  @param hostIP   主机IP，默认值：@"119.147.71.84"
*  @param hostPort 通信端口，默认值：19800
*  @param errPtr   连接失败
*/
- (BOOL)socketBC_ContectWith:(NSString *)hostIP andPort:(int)hostPort error:(NSError **)errPtr;


#pragma mark - TCP的断开
- (void)socketBC_DisConnect;


#pragma mark - TCP连接状态
#pragma mark
- (BOOL)socketBC_IsConnected;



#pragma mark - 发送消息
#pragma mark
/**
 *  TCP数据包发送入口
 *
 *  @param sendData
 *  @param tag
 */
- (void)socketBC_SendData:(NSData *)sendData withTag:(long)tag;



#pragma mark - TCP回调代理
#pragma mark 可注册一个或多个代理，事件广播到每个代理上
#pragma mark
/**
 *  注册TCP消息回调
 *  会将TCP通信过程及结果分发到指定线程
 *  @param delegate      接收回调对象
 *  @param delegateQueue 接收回调的线程
 */
- (void)socketBC_AddDelegate:(id)delegate delegateQueue:(dispatch_queue_t)delegateQueue;
- (void)socketBC_RemoveDelegate:(id)delegate delegateQueue:(dispatch_queue_t)delegateQueue;

/**
 *  销毁时，提前移除所有代理，切记此处对代理是强引用的
 */
- (void)socketBC_RemoveAllDelegates;



@end

//
//  ScoketBaseCommunicationDelegate.h
//  BBProject
//
//  Created by qthd on 16/1/29.
//  Copyright © 2016年 蜻蜓互动. All rights reserved.
//

#ifndef ScoketBaseCommunicationDelegate_h
#define ScoketBaseCommunicationDelegate_h

@protocol ScoketBaseCommunicationDelegate

@optional

/**
 *  Tcp 正在链接
 */
- (void)socketBC_tcpWillConnect;

/**
 *  Tcp 已链接
 */
- (void)socketBC_tcpDidConnect;

/**
 *  通知业务层 即将发送tag关联的data包
 *
 *  @param data 需要发送的data包
 *  @param tag  data包的标记
 */
- (void)socketBC_willSendData:(NSData *)data withTag:(long)tag;

/**
 *  通知业务层 已发送tag关联的data包
 *
 *  @param data 已发送的data包
 *  @param tag  data包的标记
 */
- (void)socketBC_didSendData:(NSData *)data withTag:(long)tag;

/**
 *  发送错误，如已断开连接的时候、超时
 *
 *  @param error 发送错误
 */
- (void)socketBC_didSendError:(NSError *)error withTag:(long)tag;

/**
 *  通知业务层 收到tag标记的data包
 *
 *  @param data 收到的data包
 *  @param tag  data包的标记
 */
- (void)socketBC_didReciveData:(NSData *)data withTag:(long)tag;

/**
 *  通知业务层 收取tag标记的data包发生错误
 *
 *  @param error 错误描述
 *
 *  注意：暂时未想到什么场景调用此方法
 */
- (void)socketBC_didReceiveError:(NSError *)error withTag:(long)tag;


/**
 *  Tcp 即将断开链接
 */
- (void)socketBC_tcpWillDisconnect;

/**
 *  Tcp 已断开链接
 *
 *  @param error 断开链接的错误描述，可能为NULL
 */
- (void)socketBC_tcpDidDisconnectWithError:(NSError *)error;

@end


#endif /* ScoketBaseCommunicationDelegate_h */

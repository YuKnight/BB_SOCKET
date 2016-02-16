
/**
 SocketManager
 重要：使用前请先阅读
 重要：该类为TCP通信模块对外唯一入口
 
 
 管理以下功能点：
 
     1、对接TCP基础通信：连接、断开连接、连接状态、收发数据结果
        ScoketBaseCommunication
     
     2、缓存请求队列，方便请求结果的处理
        self.socketRequestMDic
        SocketRequestModel队列中的模型类
     
     3、管理TCP连接授权
        - socketM_RequestAuth 
     
     4、管理心跳包
        ScoketHeartBeat（同业务层的数据处理）
     
     5、数据的序列化 + 反序列化
     
            Apollo消息体 ——> Data消息体 + CMDID ——> Apollo消息包 ——> Data消息包
     
            Data消息包 ——> Apollo消息包 ——> Data消息体 + CMDID ——>Apollo消息体
 
 后期扩展：
 
     1、管理数据分发
        SocketDespatchCenter
        SocketResult(结果模型)
      
     2、管理连接断开的自动重连
        SocketAutoReconnect
      
     3、连接加入超时设置，超过3次retry则定为失败，反馈给上层业务
 
 
 */
#import <Foundation/Foundation.h>

@class ApolloTClientPackage;
@protocol SocketManagerDelegate <NSObject>

@optional

/**
 *  类似HTTP请求，某个业务请求，通过该代理方法返回请求的响应结果
 *
 *  @param package 响应结果数据，通过 package.jce_msgBody.jce_nCMDID 来转成对应业务的数据模型
 *  @param error   发生请求错误，成功时为nil
 */
-(void)socketMDelegate_TCPRequestComplete:(ApolloTClientPackage *)package
                                    Error:(NSError *)error;

@end




@interface SocketManager : NSObject

#pragma mark - SocketManager单例
+ (SocketManager *)shareSocketManager;

#pragma mark - 连接、重连、断开连接
#pragma mark

#pragma mark 创建socket并建立连接
/**
 *  启动TCP连接
 *
 *  @param timeOut 超时时间，-1表示一直尝试连接
 *
 *  连接结果 发送通知：SMNOTIFICATION_TCPCONNECTRESULT
 *  授权结果 发送通知：SMNOTIFICATION_TCPAUTHRESULT
 *
 */
#define SMNOTIFICATION_TCPCONNECTRESULT @"SM_TCPConnectResult"
#define SMNOTIFICATION_TCPCONNECTRESULT_KEY @"SM_TCPConnectResult_Key"
#define SMNOTIFICATION_TCPAUTHRESULT @"SM_TCPAuthResult"
#define SMNOTIFICATION_TCPAUTHRESULT_KEY @"SM_TCPAuthResult_Key"
- (void)socketM_ContectWithTime:(NSTimeInterval)timeOut;
 
#pragma mark socket重连
- (void)socketM_reConnect;

#pragma mark 断开Scoket连接
#define SMNOTIFICATION_TCPDISCONNECTED @"SM_TCPDisConnected"
#define SMNOTIFICATION_TCPDISCONNECTED_KEY @"SM_TCPDisConnected_Key"
- (void)socketM_DisConnect;


#pragma mark Scoket是否与服务器连接、是否已授权

- (BOOL)socketM_isConnected;

- (BOOL)socketM_isAuth;


#pragma mark - 基础功能：收、发、重发、过滤重复包
#pragma mark

/**
 *  所有业务层相关Socket包的发送入口
 *
 *  @param msgData  Apollo业务数据（消息体）转成NSData格式的数据包
 *  @param CMDID    协议号
 *  @param response 接收回调的响应者
 */
- (void)socketM_sendWithData:(NSData *)msgData
                     withCMD:(int)CMDID
                withDelegate:(__weak id<SocketManagerDelegate>)response;


@end


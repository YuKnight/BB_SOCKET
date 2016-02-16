/**
 
 流程：
 
    发心跳包：
        启动定时器 ——> 组装好模型 ——> 调用SocketManager发送接口
 
    收心跳包：
        查看 SocketManager 的一下方法：
        - (void)socketBC_didReciveData:(NSData *)data withTag:(long)tag
 
 */
#import <Foundation/Foundation.h>

@interface SocketHeartBeat : NSObject


/**
 *  优化心跳包
 *
 *  @param lasttime 最近成功发送一次TCP包的时间
 */
- (void)socketH_updateLastSendReceiveTime:(NSTimeInterval)lasttime;


/**
 *  启动心跳包
 */
- (void)socketH_heartbeatStart;


/**
 *  关闭心跳包
 */
- (void)socketH_heartbeatStop;



@end

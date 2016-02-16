//
//  SocketHeartBeat.m
//  BBProject
//
//  Created by qthd on 16/1/27.
//  Copyright © 2016年 蜻蜓互动. All rights reserved.
//

#define MIN_KEEPALIVE_INTERVAL     29.0

#import "SocketHeartBeat.h"
#import "ApolloECLIENT_COMMAND.h"

//apollo包回调
#import "ApolloTClientPackage.h"

@interface SocketHeartBeat () <SocketManagerDelegate>

@property (nonatomic, assign) NSTimeInterval keepAliveInterval; //心跳间隔时间
@property (nonatomic, assign) NSTimeInterval lastSendReceiveTime; //最近发包时间
@property (nonatomic, strong) dispatch_source_t keepAliveTimer; //定时器
@property (nonatomic, strong) dispatch_queue_t timeQueue; //心跳间隔时间



@end

@implementation SocketHeartBeat

-(instancetype)init
{
    self = [super init];
    if(self)
    {
        self.keepAliveInterval = MIN_KEEPALIVE_INTERVAL;
        self.timeQueue = dispatch_queue_create("timeQueue", NULL);
    }
    return self;
}

-(void)dealloc
{
    self.timeQueue = nil;
    self.keepAliveTimer = nil;
    DDLogInfo(@"SocketHeartBeat dealloc");
}

#pragma mark 更新最新SOCKET通信时间，优化心跳包
- (void)socketH_updateLastSendReceiveTime:(NSTimeInterval)lasttime
{
    self.lastSendReceiveTime = lasttime;
    
    //重置计时器
    [self socketH_heartbeatStart];
}

#pragma mark 开始心跳
- (void)socketH_heartbeatStart
{
    if (self.keepAliveTimer)
    {
        dispatch_source_cancel(self.keepAliveTimer);
        self.keepAliveTimer = NULL;
    }
    
    if (self.keepAliveInterval > 0)
    {
        self.keepAliveTimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, self.timeQueue);
        
        __weak SocketHeartBeat *wself = self;
        dispatch_source_set_event_handler(self.keepAliveTimer, ^{
            @autoreleasepool {
                [wself keepAlive];
            }
        });
        
        dispatch_source_set_cancel_handler(self.keepAliveTimer, ^{
            DDLogInfo(@"dispatch_release(keepAliveTimer)");
        });
        
        // Everytime we send or receive data, we update our lastSendReceiveTime.
        // We set our timer to fire several times per keepAliveInterval.
        // This allows us to maintain a single timer,
        // and an acceptable timer resolution (assuming larger keepAliveIntervals).
        uint64_t interval = (self.keepAliveInterval * NSEC_PER_SEC);
        
        dispatch_time_t tt = dispatch_time(DISPATCH_TIME_NOW, interval);
        
        dispatch_source_set_timer(self.keepAliveTimer, tt, interval, 1.0);
        dispatch_resume(self.keepAliveTimer);
    }
}


#pragma mark 停止心跳
- (void)socketH_heartbeatStop
{
    if (self.keepAliveTimer)
    {
        dispatch_source_cancel(self.keepAliveTimer);
        self.keepAliveTimer = NULL;
    }
}


/**
 * 发送心跳包.
 **/
- (void)keepAlive
{
    NSTimeInterval now = [NSDate timeIntervalSinceReferenceDate];
    NSTimeInterval elapsed = (now - self.lastSendReceiveTime);
    
    DDLogInfo(@"心跳包间隔时间:%f，当前差值:%f",MIN_KEEPALIVE_INTERVAL,elapsed);
    
    //如果心跳包时间一直未更新，大于3次心跳包时间，断开TCP
    if (elapsed > self.keepAliveInterval * 3)
    {
        [[SocketManager shareSocketManager] socketM_DisConnect];
    }
    else if(elapsed > self.keepAliveInterval)
    {
        //发送心跳包
        [[SocketManager shareSocketManager] socketM_sendWithData:nil withCMD:ApolloECLIENT_COMMAND_EMSG_HELLO withDelegate:self];
    }
}

#pragma mark - SocketManagerDelegate

-(void)socketMDelegate_TCPRequestComplete:(ApolloTClientPackage *)package
                             Error:(NSError *)error
{
    self.lastSendReceiveTime = [NSDate timeIntervalSinceReferenceDate];
    
    DDLogInfo(@"SocketMD_TCPRequestComplete %@ error %@",package,error);
}



@end

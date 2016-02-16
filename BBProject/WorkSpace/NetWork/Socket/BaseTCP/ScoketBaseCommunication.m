//
//  ScoketBaseCommunication.m
//  BBProject
//
//  Created by qthd on 16/1/28.
//  Copyright © 2016年 蜻蜓互动. All rights reserved.
//

#import "ScoketBaseCommunication.h"

#import "GCDAsyncSocket.h"

#import "GCDMulticastDelegate.h"
#import "NSData+DataLengthTranslate.h"


#define kSOCKETBC_TIMEOUT_READ          -1
#define kSOCKETBC_TIMEOUT_WRITE         -1

#define kSOCKETBC_DATALENGTH      2

#pragma mark - socket状态
typedef enum
{
    SOCKETSTATE_UNCONNECTED  = 0,//未连接
    SOCKETSTATE_CONNECTING   = 1,//连接中
    SOCKETSTATE_CONNECTED    = 2,//已连接
    SOCKETSTATE_DISCONNECTED = 3,//已断开
}SocketState;


@interface ScoketBaseCommunication ()


//TCP链接 主机 + 端口
@property (nonatomic,assign) UInt16 hostPort;
@property (nonatomic,copy  ) NSString *hostIPAddress;

//链接状态
@property (nonatomic,assign) SocketState socketState;

//处理收发的Queue，确保收发同步
@property (nonatomic,strong) dispatch_queue_t tcpQueue;

//收包解析
@property (nonatomic,assign) NSInteger receiveDataLength;
@property (nonatomic,strong) NSMutableData *receiveMData;

//GCD TCP 通信
@property (nonatomic,strong) GCDAsyncSocket *asyncSocket;

//TCP通信状态分发给上层业务
@property (nonatomic,strong) GCDMulticastDelegate <ScoketBaseCommunicationDelegate> *multicastDelegate; //分发事件到注册的代理

@end

@implementation ScoketBaseCommunication

- (id)init {
    if (self = [super init])
    {
        self.tcpQueue = dispatch_queue_create("tcpQueue", NULL);
        
        self.multicastDelegate = (GCDMulticastDelegate <ScoketBaseCommunicationDelegate> *) [[GCDMulticastDelegate alloc] init];
        
        self.socketState = SOCKETSTATE_UNCONNECTED;
        
        self.receiveMData = [[NSMutableData alloc] initWithCapacity:0];
        
        //默认 IP 和 端口
#ifdef DEBUG
        self.hostPort = 19800;
        self.hostIPAddress = @"119.147.71.84";
#else
       
#endif
        self.asyncSocket = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:self.tcpQueue];
        
    }
    return self;
}




- (void)dealloc {
    
    self.tcpQueue = nil;
    
    self.receiveMData = nil;
    
    [self.asyncSocket setDelegate:nil delegateQueue:NULL];
    [self.asyncSocket disconnect];
    self.asyncSocket = nil;
    
    
    //移除所有回调
    [self socketBC_RemoveAllDelegates];
}


#pragma mark - TCP的连接

- (BOOL)socketBC_Connect:(NSError **)errPtr {
    
    __block BOOL result = NO;
    __block NSError *err = nil;
    __weak ScoketBaseCommunication*wself = self;
    dispatch_block_t block = ^{
        @autoreleasepool {
            
            if ([wself.hostIPAddress length] == 0)
            {
                result = NO;
            }
            else
            {
                // Open TCP connection to the configured hostIPAddress.
                NSError *connectErr = nil;
                
                wself.socketState = SOCKETSTATE_CONNECTING;
                
                // Notify delegates
                [wself.multicastDelegate socketBC_tcpWillConnect];
                
                result = [wself.asyncSocket connectToHost:wself.hostIPAddress onPort:wself.hostPort error:errPtr];
                
                if (!result)
                {
                    err = connectErr;
                    wself.socketState = SOCKETSTATE_UNCONNECTED;
                }
            }
        }
    };
    
    dispatch_sync(self.tcpQueue, block);
    
    if (errPtr)
        *errPtr = err;
    
    return result;
}
 
- (BOOL)socketBC_ContectWith:(NSString *)hostIP andPort:(int)hostPort error:(NSError **)errPtr
{
    BOOL result = NO;
    if (self.socketState == SOCKETSTATE_CONNECTED)
    {
        result = YES;
    }
    else
    {
        if(![hostIP isEqualToString:self.hostIPAddress])
        {
            self.hostIPAddress = hostIP;
        }
        if(hostPort != self.hostPort)
        {
            self.hostPort = hostPort;
        }
        
        result = [self socketBC_Connect:errPtr];
    }
    
    return result;
}


#pragma mark - TCP的断开

- (void)socketBC_DisConnect
{
    __weak ScoketBaseCommunication *wself = self;
    dispatch_block_t block = ^{
        @autoreleasepool {
            if (wself.socketState != SOCKETSTATE_DISCONNECTED)
            {
                
                [wself.multicastDelegate socketBC_tcpWillDisconnect];
               
                [wself.asyncSocket disconnect];
                
                wself.socketState = SOCKETSTATE_DISCONNECTED;

            }
        }
    };
    dispatch_async(wself.tcpQueue, block);
}


#pragma mark - TCP连接状态
#pragma mark
- (BOOL)socketBC_IsConnected
{
    __block BOOL result = NO;
    __weak ScoketBaseCommunication *wself = self;
    dispatch_block_t block = ^{
        result = (wself.socketState == SOCKETSTATE_CONNECTED);
    };
    dispatch_sync(self.tcpQueue, block);
    
    return result;
}



#pragma mark - 发送消息消息
#pragma mark

- (void)socketBC_SendData:(NSData *)sendData withTag:(long)tag
{
    if (self.socketState != SOCKETSTATE_CONNECTED)
    {
#warning    错误码的统一 还需要整合 本地定义 + 服务器定义 + 系统定义
        [self.multicastDelegate socketBC_didSendError:[NSError errorWithDomain:@"当前并未建立连接" code:0 userInfo:nil] withTag:tag];
        return;
    }
    
    //1、数据高低位转换：data前固定字节填充包的长度信息
    int length = (int)sendData.length + kSOCKETBC_DATALENGTH;
    NSData *lengthData = [NSData socketBC_DataWithLength:length];
    NSMutableData *sendResultData = [NSMutableData dataWithData:lengthData];
    [sendResultData appendData:sendData];
 
    // We're getting ready to send a message.
    // We need to notify delegates of this action to allow them to optionally alter the message element.
    SEL selector = @selector(socketBC_willSendData:withTag:);
    if ([self.multicastDelegate countForSelector:selector] == 0)
    {
        
        //1、发送包含长度信息的data包
        [self.asyncSocket writeData:sendResultData
                   withTimeout:kSOCKETBC_TIMEOUT_WRITE tag:tag];
        //2、启动收包
        [self.asyncSocket readDataWithTimeout:kSOCKETBC_TIMEOUT_READ tag:tag];
   
    }
    else
    {
        
        //此处使用dispatch_sync转发，主要目的是 确保在收到信息前将socketBC_willSendData反馈给上层业务
        __weak ScoketBaseCommunication *wself = self;
        GCDMulticastDelegateEnumerator *delegateEnumerator = [self.multicastDelegate delegateEnumerator];
        dispatch_queue_t concurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_async(concurrentQueue, ^{
            @autoreleasepool {
                
                // Allow delegates to modify outgoing element
                id delete;
                dispatch_queue_t dq;
                
                //通知上层业务
                while ([delegateEnumerator getNextDelegate:&delete delegateQueue:&dq forSelector:selector])
                {
                    dispatch_sync(dq, ^{
                        @autoreleasepool
                        {
                            [delete socketBC_willSendData:sendData withTag:tag];
                        }
                    });
                }
                
                //发送TCP包
                dispatch_async(self.tcpQueue, ^{
                    @autoreleasepool
                    {
                        [wself.asyncSocket writeData:sendResultData
                                        withTimeout:kSOCKETBC_TIMEOUT_WRITE tag:tag];
 
                        [wself.asyncSocket readDataWithTimeout:kSOCKETBC_TIMEOUT_READ tag:tag];
                    }
                });
            }
        });
    }
}

#pragma mark - GCDAsyncSocketDelegate

//当一个Socket开始和某一个IP地址＋端口号建立连接的时候调用这个方法。
- (void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port
{
    self.socketState = SOCKETSTATE_CONNECTED;
    [self.multicastDelegate socketBC_tcpDidConnect];
}

//Socket开始读取数据的时候调用这个方法
- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag
{
    [self parseDatas:data withTag:tag];
    
    [self.asyncSocket readDataWithTimeout:kSOCKETBC_TIMEOUT_READ tag:tag];
    
}
//Socket开始写取数据的时候调用这个方法
- (void)socket:(GCDAsyncSocket *)sock didWriteDataWithTag:(long)tag
{
    DDLogInfo(@"发送成功的数据tag = %ld", tag);
    
    //数据已发送的回调通知,通过Tag找到请求队列中的对应包
    [self.multicastDelegate socketBC_didSendData:nil withTag:tag];
}

- (void)socketDidDisconnect:(GCDAsyncSocket *)sock withError:(NSError *)err
{
    self.socketState = SOCKETSTATE_DISCONNECTED;
    
    [self.receiveMData resetBytesInRange:NSMakeRange(0, [self.receiveMData length])];
    [self.receiveMData setLength:0];
    self.receiveDataLength = 0;
    
    [self.multicastDelegate socketBC_tcpDidDisconnectWithError:err];


}




#pragma mark - 注册ScoketBaseCommunication回调代理
#pragma mark 可注册一个或多个代理，事件广播到每个代理上
#pragma mark
- (void)socketBC_AddDelegate:(id)delegate delegateQueue:(dispatch_queue_t)delegateQueue
{
    // Asynchronous operation (if outside xmppQueue)
    __weak ScoketBaseCommunication *wself = self;
    dispatch_block_t block = ^{
        [wself.multicastDelegate addDelegate:delegate delegateQueue:delegateQueue];
    };
    dispatch_async(self.tcpQueue, block);
}

- (void)socketBC_RemoveDelegate:(id)delegate delegateQueue:(dispatch_queue_t)delegateQueue
{
    __weak ScoketBaseCommunication *wself = self;
    dispatch_block_t block = ^{
        [wself.multicastDelegate removeDelegate:delegate delegateQueue:delegateQueue];
    };
    dispatch_async(self.tcpQueue, block);
}

- (void)socketBC_RemoveAllDelegates
{
    __weak ScoketBaseCommunication *wself = self;
    dispatch_block_t block = ^{
        [wself.multicastDelegate removeAllDelegates];
        wself.multicastDelegate = nil;
    };
    dispatch_async(self.tcpQueue, block);
}



#pragma mark - SET GET



#pragma mark - 其他 
/**
 * 递归解析
 */
- (void)parseDatas:(NSData *)data withTag:(long)tag
{
    __weak ScoketBaseCommunication *wself = self;
    
    dispatch_block_t block = ^{
        
        //1、追加
        if ([data length] > 0) {
            [wself.receiveMData appendData:data];
        }
        
        //2、获取完整包的长度
        if (wself.receiveDataLength == 0 &&
            wself.receiveMData.length >= kSOCKETBC_DATALENGTH)
        {
            /*
             Byte *testByte = (Byte *)[data bytes];
             for(int i=0; i < 8; i++) { 
             printf("testByte = %d\n",testByte[i]);
             }
             */
            wself.receiveDataLength = [NSData socketBC_DataLength:data]; //完整包大小
        }
        
        //3、若包含一个完整包，读取出来，并提交给业务层
        if (wself.receiveMData.length >= wself.receiveDataLength &&
            wself.receiveDataLength != 0)
        {
            NSData *completeData = nil;  //已完成的完整包
            NSData *afterData = nil;     //多余的数据流
            
            if (wself.receiveMData.length > wself.receiveDataLength)
            {
                
                NSInteger loc = wself.receiveDataLength;
                NSInteger len = wself.receiveMData.length - loc;
                
                //4、截取剩下数据，递归
                afterData = [wself.receiveMData subdataWithRange:NSMakeRange(loc, len)];
            } 
            
            //过滤最前面表示包长度的固定字节
            completeData = [wself.receiveMData subdataWithRange:NSMakeRange(kSOCKETBC_DATALENGTH, wself.receiveDataLength-kSOCKETBC_DATALENGTH)];
            
            //delegate分发  解析到的一段完整数据
            [wself.multicastDelegate socketBC_didReciveData:completeData withTag:tag];
            
            //重置接收
            [wself.receiveMData resetBytesInRange:NSMakeRange(0, [_receiveMData length])];
            [wself.receiveMData setLength:0];
            wself.receiveDataLength = 0;
            
            //5、递归解析剩下的data数据
            if (afterData != nil)
            {
                [wself parseDatas:afterData withTag:tag];
            }
        }
        
    };
    
    dispatch_async(self.tcpQueue, block);
    
}





@end

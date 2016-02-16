//
//  BBSocketManager.m
//  BBProject
//
//  Created by qthd on 16/1/14.
//  Copyright © 2016年 蜻蜓互动. All rights reserved.
//

#import "SocketManager.h"

#import "SocketManager+PrepareSendData.h"
#import "SocketManager+ParseReciveData.h"
#import "ScoketBaseCommunication.h"
#import "SocketHeartBeat.h"

//用户验证
#import "ApolloTReqAuth.h"
#import "ApolloCLIENT_TYPE.h"

//分发apollo数据
#import "ApolloTClientPackage.h"
#import "ApolloECLIENT_COMMAND.h"
#import "ApolloTRespAuth.h"

//ip地址
#define HOST_IP @"119.147.71.84"

//端口号
#define HOST_PORT 19800


/**
 *  请求包的管理
 */
@interface SocketRequestModel : NSObject

//请求响应者
@property (nonatomic, strong) id <SocketManagerDelegate> responser;
//该数据包标识
@property (nonatomic, copy) NSString *packageSequence;
//数据包内容
@property (nonatomic, strong) NSData *packageData;
//是否需要重发
@property (nonatomic, assign) BOOL needReSend;

@end

@implementation SocketRequestModel

@end



@interface SocketManager ()<ScoketBaseCommunicationDelegate>

//基础TCP通信
@property (nonatomic, strong) ScoketBaseCommunication *scoketBaseCommunication;

//心跳包
@property (nonatomic, assign) BOOL isAuth;
@property (nonatomic, strong) SocketHeartBeat *socketHeartBeat;

//请求包管理
@property (nonatomic, strong) NSMutableDictionary *socketRequestMDic;

@end

@implementation SocketManager


#pragma mark - SocketManager单例
+ (SocketManager *)shareSocketManager
{
    static dispatch_once_t pred = 0;
    __strong static SocketManager * sharedObject = nil;
    dispatch_once(&pred, ^{
        sharedObject = [[self alloc] init];
    });
    return sharedObject;
}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.scoketBaseCommunication = [[ScoketBaseCommunication alloc] init];
        //添加回调
        [self.scoketBaseCommunication socketBC_AddDelegate:self delegateQueue:dispatch_get_main_queue()];
        
        self.socketHeartBeat =[[SocketHeartBeat alloc] init];
        self.socketRequestMDic = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}

-(void)dealloc
{
    [self.scoketBaseCommunication socketBC_DisConnect];
    self.scoketBaseCommunication = nil;
    
    [self.socketHeartBeat socketH_heartbeatStop];
    self.socketHeartBeat = nil;
    
    [self.socketRequestMDic removeAllObjects];
    self.socketRequestMDic = nil;
}

#pragma mark - 连接、重连、断开连接
#pragma mark

#pragma mark 创建socket并建立连接
- (void)socketM_ContectWithTime:(NSTimeInterval)timeOut
{
    /*后期加入超时时间*/
    
    NSError *error;
    [self.scoketBaseCommunication socketBC_Connect:&error];
    
    //若失败，将错误通过Notificaiton返回
    //SocketErrorModel
    ////////////////////////////////
}


#pragma mark socket重连
- (void)socketM_reConnect
{
    [self socketM_ContectWithTime:-1];
}

#pragma mark 断开Scoket连接
- (void)socketM_DisConnect
{
    [self.scoketBaseCommunication socketBC_DisConnect];
    
}

#pragma mark Scoket是否与服务器连接
- (BOOL)socketM_isConnected
{
    return ([self.scoketBaseCommunication socketBC_IsConnected]);
}

- (BOOL)socketM_isAuth
{
    return ([self.scoketBaseCommunication socketBC_IsConnected] && self.isAuth);
}

#pragma mark - 心跳包处理
#pragma mark


#pragma mark 用户验证，TCP连接授权
- (void)socketM_RequestAuth
{
    //若已经授权，不再执行
    if(self.isAuth)
        return;
    
    //若TCP断开了连接，重连
    if(![self socketM_isConnected])
    {
        [self socketM_reConnect];
        return;
    }
    
    //用户未登录，延后1s执行
    if([[LocalCache shareLocalCache] token].length < 1)
    {
        [self performSelector:@selector(socketM_RequestAuth) withObject:nil afterDelay:1.0];
        DDLogInfo(@"用户未登录，延后请求");
        return;
    }
    
    ApolloTReqAuth *auth = [[ApolloTReqAuth alloc] init];
    auth.jce_sVer = APP_SHORT_VERSION;// 版本号
    auth.jce_nClientType = ApolloCLIENT_TYPE_IOS;
    
    //一下2个用户HTTP登录参数一定不能为空
    auth.jce_sDeviceID = @"E9D53B7E-8AE3-408C-BAFF-DE9287096FFD";//deviceID;
    NSString *stoken = [[LocalCache shareLocalCache] token];
    auth.jce_sessionCode = stoken ? stoken : @"";
    auth.jce_timestamp = (long)[[NSDate date] timeIntervalSince1970];
    auth.jce_apnsToken = @"";
    
    DDLogInfo(@"\n--------------------\n用户授权请求\n--------------------\n%@\n\n", auth);
    
    //调用SocketManager发送TCP数据数据
    [self socketM_sendWithData:[auth toData] withCMD:ApolloECLIENT_COMMAND_EMSG_AUTH withDelegate:nil];
    
}

#pragma mark 开始心跳
- (void)socketM_heartbeatStart
{
    if(self.isAuth)
        [self.socketHeartBeat socketH_heartbeatStart];
    else
        [self socketM_RequestAuth];
}

#pragma mark 停止心跳
- (void)socketM_heartbeatStop
{
    [self.socketHeartBeat socketH_heartbeatStop];
}

#pragma mark 更新心跳时间
- (void)socketM_updateHeartbeatLastSendReceiveTime
{
    if(self.isAuth)
        [self.socketHeartBeat socketH_updateLastSendReceiveTime:[NSDate timeIntervalSinceReferenceDate]];
    else
        [self socketM_RequestAuth];
        
}



#pragma mark - 基础功能：收、发、重发、过滤重复包
#pragma mark
/**
 *  所有TCP请求的入口 
 */
- (void)socketM_sendWithData:(NSData *)msgData
                     withCMD:(int)CMDID
                withDelegate:(__weak id<SocketManagerDelegate>)response
{
    //1、打包
    NSDictionary *packageDIC = [SocketManager socketP_PrepareSendData:msgData withCMD:CMDID];
    NSString *sequence = [packageDIC objectForKey:PREPAREDICKEY_PackageSequence];
    NSData *packageData = [packageDIC objectForKey:PREPAREDICKEY_PackageData];
    
    //2、过滤重复请求
    if([self socketM_RequestForPackageSequence:sequence])
        return;
    
    //3、缓存请求包
    SocketRequestModel *requestModel = [[SocketRequestModel alloc] init];
    requestModel.packageSequence = sequence;
    requestModel.packageData = packageData;
    requestModel.responser = response;
    [self.socketRequestMDic setObject:requestModel forKey:sequence];
    
    //4、发送二进制数据
    if([self socketM_isConnected])
    {
        [self.scoketBaseCommunication socketBC_SendData:packageData withTag:[sequence integerValue]];
    }
    else
    {
        //若未连接时,标记待发包
        requestModel.needReSend = YES;
    }
    
}




#pragma mark -   TCP请求响应的处理

/**
 *  该方法为对TCP请求响应结果的统一处理入口
 *
 *  @param package  TCP返回的响应数据，若为通信错误，可为nil
 *  @param sequence 该请求在缓存中的标识KEY
 *  @param error    是否有错误，是什么错误，可为nil
 */
- (void)socketM_TcpRequestCompleteApolloPackage:(ApolloTClientPackage *)package
                                       Sequence:(NSString *)sequence
                                          Error:(NSError *)error
{
    //分发中心处理
    [self socketD_DespatchApolloPackage:package];
    
    //若需要回调，调用回调方法
    id <SocketManagerDelegate> response = [self socketM_RequestForPackageSequence:sequence];
    if(response)
    {
        //回调方法，返回TCP请求的响应结果给业务层
        //返回package、Error
        if([response respondsToSelector:@selector(socketMDelegate_TCPRequestComplete:Error:)])
            [response socketMDelegate_TCPRequestComplete:package Error:error];
        else
            NSAssert(NULL, @"若需要回调，方法 socketM_sendWithData:withCMD: withDelegate: 中才注册delegate");
    }
}


- (void)socketM_RemoveRequestWithPackageSequence:(NSString *)sequence{
    @synchronized(_socketRequestMDic)
    {
        [_socketRequestMDic removeObjectForKey:sequence];
    }
}


- (id <SocketManagerDelegate>)socketM_RequestForPackageSequence:(NSString *)sequence {
    @synchronized(_socketRequestMDic)
    {
        SocketRequestModel *model = (SocketRequestModel *)[_socketRequestMDic objectForKey:sequence];
        return model.responser;
    }
}


/**
 *  通信异常时，结束所有请求
 *
 *  @param error 因何异常需要提前结束
 */
- (void)socketM_RemoveAllSocketRequestWithError:(NSError *)error
{
    for (NSString *sequence in [self.socketRequestMDic allKeys])
    {
        [self socketM_TcpRequestCompleteApolloPackage:nil
                                             Sequence:sequence
                                                Error:error];
    }
}


- (void)socketM_ResendFailedRequest
{
    for (NSString *sequence in [self.socketRequestMDic allKeys])
    {
        SocketRequestModel *requestmodel = [self.socketRequestMDic objectForKey:sequence];
        if([requestmodel needReSend])
        {
            requestmodel.needReSend = NO;
            [self.scoketBaseCommunication socketBC_SendData:requestmodel.packageData withTag:[sequence integerValue]];
        }
    }
}


#pragma mark -  ScoketBaseCommunicationDelegate

- (void)socketBC_tcpWillConnect
{
    DDLogInfo(@"socketBC_tcpWillConnect");
}

- (void)socketBC_tcpDidConnect
{
    DDLogInfo(@"socketBC_tcpDidConnect");
    
    //因TCP成功的通知
    [[NSNotificationCenter defaultCenter] postNotificationName:SMNOTIFICATION_TCPCONNECTRESULT object:nil];
    
    //授权,需要授权成功才能发业务相关的Socket包
    [self socketM_RequestAuth];
    
    //发送缓存中未发成功的包
    [self socketM_ResendFailedRequest];
    
    //刷新心跳包最近心跳时间
    [self socketM_updateHeartbeatLastSendReceiveTime];
}

- (void)socketBC_willSendData:(NSData *)data withTag:(long)tag
{
    DDLogInfo(@"socketBC_willSendData Tag %ld",tag);
}

- (void)socketBC_didSendData:(NSData *)data withTag:(long)tag
{
    DDLogInfo(@"socketBC_didSendData Tag %ld",tag);
}

- (void)socketBC_didSendError:(NSError *)error withTag:(long)tag
{
    [self socketM_TcpRequestCompleteApolloPackage:nil
                                         Sequence:[NSString stringWithFormat:@"%ld",tag]
                                            Error:error];
    
    DDLogInfo(@"socketBC_didSendError Tag %ld",tag);
}

- (void)socketBC_didReciveData:(NSData *)data withTag:(long)tag
{
    DDLogInfo(@"socketBC_didReciveData Tag %ld",tag);
    
    //1、解析收到的apollo包
    ApolloTClientPackage *package = [SocketManager socketP_ParseData:data];
    NSString *sequence = [NSString stringWithFormat:@"%ld", (long)package.jce_iSequence];
    
    //2、处理apollo包，并通知上层业务
    [self socketM_TcpRequestCompleteApolloPackage:package
                                         Sequence:sequence
                                            Error:nil];
    
    //刷新心跳包最近心跳时间
    [self socketM_updateHeartbeatLastSendReceiveTime];
}


- (void)socketBC_tcpWillDisconnect
{
    DDLogInfo(@"socketBC_tcpWillDisconnect");
}

- (void)socketBC_tcpDidDisconnectWithError:(NSError *)error
{
    DDLogInfo(@"socketBC_tcpDidDisconnectWithError %@",error);
    
    //停止心跳包
    [self socketM_heartbeatStop];
    
    //提前结束所有请求包
    [self socketM_RemoveAllSocketRequestWithError:error];
    
    //重置是否授权
    self.isAuth = NO;
    
    //TCP已断开连接
    NSDictionary *userinfo = error ? [NSDictionary dictionaryWithObject:error forKey:SMNOTIFICATION_TCPDISCONNECTED_KEY] : nil;
    [[NSNotificationCenter defaultCenter] postNotificationName:SMNOTIFICATION_TCPDISCONNECTED object:nil userInfo:userinfo];
    
    //如果是因错误导致，则自动重连
    if(error)
    {
        [self socketM_reConnect];
    }
}


#pragma mark -  DespatchApolloPackage 分发apollo数据

-(void)socketD_DespatchApolloPackage:(ApolloTClientPackage *)package
{
    if(!package)
        return;
    
    int cmdid = package.jce_msgBody.jce_nCMDID;
    NSData *msgData = package.jce_msgBody.jce_vMsgData;
    
    if (cmdid == ApolloECLIENT_COMMAND_EMSG_AUTH)
    {
        // 用户授权（客户端请求）
        ApolloTRespAuth *respAuth = [[ApolloTRespAuth alloc] init];
        [respAuth fromData:msgData];
        
        if (respAuth.jce_iRet == 0)
        {
            // 成功
            DDLogInfo(@"\n用户授权成功: %i, %@, %i\n\n\n", (int)respAuth.jce_iRet, respAuth.jce_sMsg, respAuth.jce_iTime);
            
            //授权成功
            self.isAuth = YES;
            
            //TCP连接授权成功的通知
            [[NSNotificationCenter defaultCenter] postNotificationName:SMNOTIFICATION_TCPAUTHRESULT object:nil];
            
            //授权成功，发送心跳包
            [self socketM_heartbeatStart];
        }
        else
        {
            // 授权失败后，停止心跳并断开长连接
            DDLogInfo(@"\n用户授权失败xxx: %i, %@\n\n\n", (int)respAuth.jce_iRet, respAuth.jce_sMsg);
            
            //TCP连接授权失败的通知
            NSError *error = [NSError errorWithDomain:respAuth.jce_sMsg
                                                 code:(int)respAuth.jce_iRet
                                             userInfo:nil];
            NSDictionary *userinfo = [NSDictionary dictionaryWithObject:error
                                                                 forKey:SMNOTIFICATION_TCPAUTHRESULT_KEY];
            [[NSNotificationCenter defaultCenter] postNotificationName:SMNOTIFICATION_TCPAUTHRESULT
                                                                object:nil
                                                              userInfo:userinfo];
            
            //授权失败，断开连接，需要业务端判断是否需要重新连接，或者直接发送重新授权请求
            self.isAuth = NO;
            [self socketM_DisConnect];
        }
    }
    else if (cmdid == ApolloECLIENT_COMMAND_EMSG_HELLO)
    {
        // 心跳（客户端请求）
        DDLogInfo(@"\n--------------------\nheartbeatStop 心跳成功\n--------------------\n\n");
    }
    else if (cmdid == ApolloECLIENT_COMMAND_EMSG_LOGOUT)
    {
        // 用户注销（客户端请求）
        DDLogInfo(@"\n--------------------\n注销成功\n--------------------\n");
    }
    else if (cmdid == ApolloECLIENT_COMMAND_EMSG_NOTICE_PSUH && msgData.length)
    {
        // 接收服务推送给客户端的通知盒子
        DDLogInfo(@"\n--------------------\n接收服务推送给客户端的通知盒子...\n--------------------\n\n");
    }
    else if (cmdid == ApolloECLIENT_COMMAND_EMSG_CHAT_BOXS_PUSH && msgData.length)
    {
        // 接收服务推送客户端的消息盒子
        DDLogInfo(@"\n--------------------\n接收服务推送客户端的消息盒子...\n--------------------\n\n");
        
    }
    else if (cmdid == ApolloECLIENT_COMMAND_EMSG_KICKAWAY)
    {
        // 被踢
        DDLogInfo(@"\n--------------------\n被踢...\n--------------------\n\n");
    }
    else if (cmdid == ApolloECLIENT_COMMAND_EMSG_NOAUTHCMD)
    {
        // 没有验证命令
        DDLogInfo(@"\n--------------------\n没有验证命令...\n--------------------\n\n");
    }
    else if (cmdid == ApolloECLIENT_COMMAND_EMSG_QUERY_AUDIT_PUSH && msgData.length)
    {
        // 接收服务端推送动态审核列表
        DDLogInfo(@"\n--------------------\n接收服务端推送动态审核列表...\n--------------------\n\n");
    }
    else if (cmdid == ApolloECLIENT_COMMAND_EMSG_QUERY_ZONE_PUSH && msgData.length)
    {
        // 接收服务端推送帖子助手列表
        DDLogInfo(@"\n--------------------\n接收服务端推送帖子助手列表...\n--------------------\n\n");
    }
    else if (cmdid == ApolloECLIENT_COMMAND_EMSG_UPDATE_USER_BASE)
    {
        //接收到更新用户资料通知
        DDLogInfo(@"\n--------------------\n接收服务端推送更新用户资料...\n--------------------\n\n");
    }
    else if (cmdid == ApolloECLIENT_COMMAND_EMSG_QUERY_BANBAN_DAILYPAPER_PUSH)
    {
        //接收服务端推送的班班日报消息
        DDLogInfo(@"\n--------------------\n接收服务端推送的班班日报列表...\n--------------------\n\n");
    }
    else if (cmdid == ApolloECLIENT_COMMAND_EMSG_UPGRADE)
    {
        //接收服务端推送的升级消息
        DDLogInfo(@"\n--------------------\n接收服务端推送的升级消息...\n--------------------ß\n\n");
    }
    else
    {
        DDLogInfo(@"\n消息回调...");
    }
}

@end

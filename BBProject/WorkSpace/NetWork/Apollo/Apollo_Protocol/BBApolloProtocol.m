//
//  BBApolloProtocol.m
//  XXT
//
//  Created by foxmsdn on 15/1/27.
//  Copyright (c) 2015年 蜻蜓互动. All rights reserved.
//

#import "BBApolloProtocol.h"
#import "ApolloTRespPackage.h"
#import "ApolloTClientPackage.h"
#import "ApolloCLIENT_TYPE.h"

@implementation JceObjectV2(Banban)

#pragma mark - 打包一个协议
- (NSData *)packageByCommand:(JceInt32)command
{ //包数据
    ApolloTHttpPackage *request = [[ApolloTHttpPackage alloc] init];
    request.jce_sVer = APP_SHORT_VERSION;                                //版本号
    request.jce_nClientType = ApolloCLIENT_TYPE_IOS;                     //客户端类型
    request.jce_uid = @"0";//![NSString isEmptyOrNull:Preferences.uid] ? Preferences.uid : @"0";
    request.jce_nCMDID = command;
    request.jce_iSequence = (long)[[NSDate date] timeIntervalSince1970]; //时间戳
    request.jce_vecData = [self toData];
    request.jce_sToken = @"";
//    NSLog(@"\n--------------------\nrequest parames:\n--------------------\n%@\njce_vecData: %@\n\n", request, self);
    
    return [request toData];
}

#pragma mark - 解包一个协议
- (int)unpackageFromData:(NSData *)data
{
    ApolloTRespPackage *response = [[ApolloTRespPackage alloc] init];
    [response fromData:data];
    int result = response.jce_iResult;
    if (result == 0)
    {
        [self fromData:response.jce_vecData];
    }
//    NSLog(@"\nresponse message: %i, %@\n%@\n\n\n", response.jce_iResult, response.jce_sMessage, response.jce_vecData);
    
    return result;
}

#pragma mark - 解包一个协议 block
- (void)unpackageFromData:(NSData *)data block:(unpackageCompleteBlock)block
{
    ApolloTRespPackage *response = [[ApolloTRespPackage alloc] init];
    [response fromData:data];
    
    int result = response.jce_iResult;
    if (result == 0)
    {
        [self fromData:response.jce_vecData];
    }
    if (block != nil)
    {
        block(response.jce_iResult, response.jce_sMessage);
    }
}

- (NSString *)messageFromData:(NSData *)data
{
    ApolloTRespPackage *response = [[ApolloTRespPackage alloc] init];
    [response fromData:data];
    
    int result = response.jce_iResult;
    if (result == 0)
    {
        [self fromData:response.jce_vecData];
    }
    
    return  response.jce_sMessage;
}

#pragma mark - --------------------长连接

#pragma mark - 打包一个长连接协议
+ (NSData *)packageWithCommand:(JceInt32)command
{ //包数据
    ApolloTHttpPackage *request = [[ApolloTHttpPackage alloc] init];
    request.jce_sVer = APP_SHORT_VERSION;                                //版本号
    request.jce_nClientType = ApolloCLIENT_TYPE_IOS;                     //客户端类型
//    request.jce_uid = ![NSString isEmptyOrNull:Preferences.uid] ? Preferences.uid : @"0";
    request.jce_nCMDID = command;
    request.jce_iSequence = (long)[[NSDate date] timeIntervalSince1970]; //时间戳
    request.jce_sToken = @"";
    
    return [request toData];
}

#pragma mark - 解包一个长连接协议
- (int)unpackageResponseFromData:(id)responseData
{
    ApolloTClientPackage *response = nil;
    if ([responseData isKindOfClass:[ApolloTClientPackage class]])
    {
        response = (ApolloTClientPackage *)responseData;
    }
    else
    {
        [response fromData:responseData];
    }
    ApolloTMsgBody *msgBody = response.jce_msgBody;
    int result = msgBody.jce_iRet;
    if (result == 0)
    {
        if (msgBody.jce_vMsgData && msgBody.jce_vMsgData.length)
        {
            [self fromData:msgBody.jce_vMsgData];
        }
        else
        {
            result = -1;
        }
    }
    
    return result;
}

#pragma mark - 解包一个长连接协议 block
- (void)unpackageResponseFromData:(NSData *)responseData block:(unpackageCompleteBlock)block
{
    ApolloTClientPackage *response = nil;
    if ([responseData isKindOfClass:[ApolloTClientPackage class]])
    {
        response = (ApolloTClientPackage *)responseData;
    }
    else
    {
        [response fromData:responseData];
    }
    ApolloTMsgBody *msgBody = response.jce_msgBody;
    int result = msgBody.jce_iRet;
    if (result == 0 && msgBody.jce_vMsgData)
    {
        [self fromData:msgBody.jce_vMsgData];
    }
    if (block != nil)
    {
        block(result, msgBody.jce_sMsg);
    }
}

@end

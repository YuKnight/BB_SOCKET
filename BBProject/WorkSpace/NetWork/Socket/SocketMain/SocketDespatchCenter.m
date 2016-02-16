//
//  SocketDespatchCenter.m
//  BBProject
//
//  Created by qthd on 16/1/22.
//  Copyright © 2016年 蜻蜓互动. All rights reserved.
//

#import "SocketDespatchCenter.h" 
#import <arpa/inet.h>
#import <netdb.h>

//分发apollo数据
#import "AppDelegate.h"
#import "ApolloTClientPackage.h"
#import "ApolloECLIENT_COMMAND.h"
#import "ApolloTRespAuth.h"
 
@implementation SocketDespatchCenter

#pragma mark - SocketDespatchCenter单例
+ (SocketDespatchCenter *)shareSocketDespatchCenter
{
    static dispatch_once_t pred = 0;
    __strong static SocketDespatchCenter * sharedObject = nil;
    dispatch_once(&pred, ^{
        sharedObject = [[self alloc] init];
    });
    
    return sharedObject;
}

#pragma mark -  DespatchApolloPackage 分发apollo数据




#pragma mark - 根据域名获取ip地址
- (NSString *)getIPWithHost:(const NSString *)host
{
    const char *hostName = [host UTF8String];
    struct hostent *phot;
    @try
    {
        phot = gethostbyname(hostName);
    }
    @catch (NSException *exception)
    {
        return nil;
    }
    struct in_addr ip_addr;
    memcpy(&ip_addr, phot->h_addr_list[0], 4);
    char ip[20] = {0};
    inet_ntop(AF_INET, &ip_addr, ip, sizeof(ip));

    return [NSString stringWithUTF8String:ip];
}

@end

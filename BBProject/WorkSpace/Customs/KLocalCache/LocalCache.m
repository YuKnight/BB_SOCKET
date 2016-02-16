//
//  LocalCache.m
//  BBProject
//
//  Created by qthd on 16/1/14.
//  Copyright © 2016年 蜻蜓互动. All rights reserved.
//

#import "LocalCache.h"

@interface LocalCache ()

- (void)setObject:(id)object forKey:(NSString *)key; //设置对象到本地
- (id)objectForKey:(NSString *)key;                  //获取本地对象

@end

@implementation LocalCache

#pragma mark - LocalCache单例
+ (LocalCache *)shareLocalCache
{
    static dispatch_once_t pred = 0;
    __strong static LocalCache * sharedObject = nil;
    dispatch_once(&pred, ^{
        sharedObject = [[self alloc] init];
    });
    
    return sharedObject;
}

#pragma mark - 设置对象到本地
- (void)setObject:(id)object forKey:(NSString *)key
{
    NSUserDefaults *userDefaultes = [NSUserDefaults standardUserDefaults];
    [userDefaultes setObject:object forKey:key];
    [userDefaultes synchronize];
}

#pragma mark - 获取本地对象
- (id)objectForKey:(NSString *)key
{
    NSUserDefaults *userDefaultes = [NSUserDefaults standardUserDefaults];
    id object = [userDefaultes objectForKey:key];
    return object;
}

#pragma mark - token
- (void)setToken:(NSString *)token
{
    [self setObject:token forKey:@"token"];
}
- (NSString *)token
{
    return [self objectForKey:@"token"];
}

#pragma mark - 设置是否是第一次启动
- (void)setIsFrist:(BOOL)isFrist
{
    NSUserDefaults *userDefaultes = [NSUserDefaults standardUserDefaults];
    [userDefaultes setBool:isFrist forKey:@"isFrist"];
    [userDefaultes synchronize];
}
- (BOOL)isFrist
{
    NSUserDefaults *userDefaultes = [NSUserDefaults standardUserDefaults];
    BOOL isFrist = [userDefaultes boolForKey:@"isFrist"];
    return isFrist;
}

#pragma mark - 当前用户ID
- (void)setUserID:(NSString *)userID
{
    [self setObject:userID forKey:@"userID"];
}
-(NSString *)userID
{
    return [self objectForKey:@"userID"];
}

#pragma mark - IP地址
- (void)setServerIP:(NSString *)serverIP
{
    [self setObject:serverIP forKey:@"serverIP"];
}
-(NSString *)serverIP
{
    return [self objectForKey:@"serverIP"];
}

#pragma mark - 端口
- (void)setServerPort:(NSString *)serverPort
{
    [self setObject:serverPort forKey:@"serverPort"];
}
-(NSString *)serverPort
{
    return [self objectForKey:@"serverPort"];
}

#pragma mark - 设备码(UUID)
- (void)setDeviceCode:(NSString *)deviceCode
{
    [self setObject:deviceCode forKey:@"deviceCode"];
}
-(NSString *)deviceCode
{
    return [self objectForKey:@"deviceCode"];
}

@end

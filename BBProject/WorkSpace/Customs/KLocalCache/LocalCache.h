//
//  LocalCache.h
//  BBProject
//  本地持久化处理 NSUserDefaults
//  Created by qthd on 16/1/14.
//  Copyright © 2016年 蜻蜓互动. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LocalCache : NSObject

#pragma mark - LocalCache单例（本地持久化处理）
+ (LocalCache *)shareLocalCache;

#pragma mark - token
@property (nonatomic, copy) NSString *token;

#pragma mark - 设置是否是第一次启动
@property (nonatomic, assign) BOOL isFrist;

#pragma mark - 当前用户ID
@property (nonatomic, copy) NSString *userID;

#pragma mark - IP地址
@property (nonatomic, copy) NSString *serverIP;

#pragma mark - 端口
@property (nonatomic, copy) NSString *serverPort;

#pragma mark - 设备码(UUID)
@property (nonatomic, copy) NSString *deviceCode;

@end

//
//  BBApolloProtocol.h
//  XXT
//
//  Created by foxmsdn on 15/1/27.
//  Copyright (c) 2015年 蜻蜓互动. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ApolloTHttpPackage.h"

typedef void (^unpackageCompleteBlock)(int result, id responseData);

@interface JceObjectV2(Banban)

#pragma mark - --------------------http
#pragma mark - 打包一个协议
- (NSData *)packageByCommand:(JceInt32)command;
#pragma mark - 解包一个协议
- (int)unpackageFromData:(NSData *)data;
#pragma mark - 解包一个协议 block
- (void)unpackageFromData:(NSData *)data block:(unpackageCompleteBlock)block;

- (NSString *)messageFromData:(NSData *)data;

#pragma mark - --------------------长连接
#pragma mark - 打包一个长连接协议
+ (NSData *)packageWithCommand:(JceInt32)command;
#pragma mark - 解包一个长连接协议
- (int)unpackageResponseFromData:(id)responseData;
#pragma mark - 解包一个长连接协议 block
- (void)unpackageResponseFromData:(id)responseData block:(unpackageCompleteBlock)block;

@end
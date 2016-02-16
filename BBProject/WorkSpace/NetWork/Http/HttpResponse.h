//
//  HttpResponse.m
//  BBProject
//  描述一个 HTTP 请求的响应结果
//  Created by qthd on 16/1/19.
//  Copyright © 2016年 蜻蜓互动. All rights reserved.
//

@interface HttpResponse : NSObject

@property (nonatomic, assign, readonly, getter=isOk) BOOL ok; //是否成功

#pragma mark - 使用状态码和返回数据来初始化Http返回结果
- (instancetype)initWithStatus:(int)status data:(NSData *)data;

#pragma mark - 使用错误码初始化Http返回结果
- (instancetype)initWithError:(NSError *)error;


#pragma mark - 获得返回数据
- (NSData *)getData;

#pragma mark - 获得状态码
- (int)getStatus;

#pragma mark - 获得描述信息
- (NSString *)getDescription;

#pragma mark - 获得错误码
- (NSError *)getError;

@end
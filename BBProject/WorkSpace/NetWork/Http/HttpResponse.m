//
//  HttpResponse.m
//  BBProject
//
//  Created by qthd on 16/1/19.
//  Copyright © 2016年 蜻蜓互动. All rights reserved.
//

#define HTTP_RESULT_ERROR -1 //连接异常

#import "HttpResponse.h"

static NSString *domain = @"banban.im";

@interface HttpResponse ()

@property (nonatomic, assign) int status;     //状态码
@property (nonatomic, strong) NSData *data;   //返回的数据
@property (nonatomic, strong) NSError *error; //错误信息

@end

@implementation HttpResponse

#pragma mark - 使用状态码和返回数据来初始化Http返回结果
- (instancetype)initWithStatus:(int)status data:(NSData *)data
{
    self = [super init];
    
    if (self)
    {
        self.status = status;
        self.data = data;
        
        if (status != 200)
        {
            if (data == nil)
            {
                self.error = [[NSError alloc] initWithDomain:domain code:_status userInfo:nil];
            }
            else
            {
                NSError *tempError = nil;
                NSDictionary *userInfoDict = [NSJSONSerialization JSONObjectWithData:data
                                                                             options:NSJSONReadingMutableLeaves
                                                                               error:&tempError];
                if (tempError != nil)
                {
                    userInfoDict = @{@"error" : [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]};
                }
                self.error = [[NSError alloc] initWithDomain:domain code:_status userInfo:userInfoDict];
            }
        }
        else if (data == nil || data.length == 0)
        {
            NSDictionary *userInfoDict = @{@"error" : @"no response json"};
            self.error = [[NSError alloc] initWithDomain:domain code:_status userInfo:userInfoDict];
        }
    }
    
    return self;
}

#pragma mark - 使用错误码初始化 Http 返回结果.
- (instancetype)initWithError:(NSError *)error
{
    self = [super init];
    
    if (self)
    {
        self.status = HTTP_RESULT_ERROR;
        self.error = error;
    }
    
    return self;
}

#pragma mark - 获得返回数据
- (NSData *)getData
{
    return self.data;
}

#pragma mark - 获得状态码
- (int)getStatus
{
    return self.status;
}

#pragma mark - 获得描述信息
- (NSString *)getDescription
{
    return [NSString stringWithFormat:@"<%@: %p, status: %d, error: %@>", NSStringFromClass([self class]), self, _status, _error];
}

#pragma mark - 获得错误码
- (NSError *)getError;
{
    return self.error;
}

#pragma mark - 是否成功
- (BOOL)isOk
{
    return (_status == 200 && _error == nil);
}

@end
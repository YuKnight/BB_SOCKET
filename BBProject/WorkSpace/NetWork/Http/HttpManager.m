//
//  HttpManager.m
//  BBProject
//
//  Created by qthd on 16/1/19.
//  Copyright © 2016年 蜻蜓互动. All rights reserved.
//

#import "HttpManager.h"
#import "AFNetworking.h"

#define HTTP_TIME_OUT 30 //超时时间

@interface HttpManager ()

@property (nonatomic) AFHTTPRequestOperationManager *operationManager; //http请求

//获得请求响应结果
- (HttpResponse *)getResponseWithOperation:(AFHTTPRequestOperation *)operation
                              responseData:(id)responseData
                                     error:(NSError *)error;

@end

@implementation HttpManager

#pragma mark - HttpManager单例
+ (HttpManager *)shareHttpManager
{
    static dispatch_once_t pred = 0;
    __strong static HttpManager * sharedObject = nil;
    dispatch_once(&pred, ^{
        sharedObject = [[self alloc] init];
    });
    
    return sharedObject;
}

#pragma mark - init 直接初始化网络对象
- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        self.operationManager = [[AFHTTPRequestOperationManager alloc] init];
        _operationManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    }
    
    return self;
}

#pragma mark - 通过请求地址和请求数据发送请求
- (void)sendHttpRequestWithUrlString:(NSString *)urlString requestData:(NSData *)requestData
{
    NSString *encodingUrlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:encodingUrlString];
    DDLogInfo(@"请求地址 ====== %@", [url absoluteString]);
    //拼装消息体
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:requestData];
    //设置超时
    [request setTimeoutInterval:HTTP_TIME_OUT];
    //发送post
    [self sendWithRequest:request];
}

#pragma mark - 通过请求地址和请求数据发送请求
- (void)sendWithRequest:(NSMutableURLRequest *)request
{
    AFHTTPRequestOperation *requestOperation =
    [_operationManager HTTPRequestOperationWithRequest:request
                                               success:^(AFHTTPRequestOperation * _Nonnull operation,
                                                         id  _Nonnull responseObject)
    { //请求成功处理
        HttpResponse *response = [self getResponseWithOperation:operation
                                                   responseData:operation.responseData
                                                          error:nil];
        DDLogInfo(@"响应成功~~~！数据是：responseObject == %@ \nresponseData == %@", responseObject, operation.responseData);
        if (nil != _delegate)
        { //通过代理通知业务层
            [self.delegate BBHttpRequestSuccess:response];
        }
    }
                                               failure:^(AFHTTPRequestOperation * _Nonnull operation,
                                                         NSError * _Nonnull error)
    { //请求失败处理
//        HttpResponse *response = [self getResponseWithOperation:operation
//                                                   responseData:operation.responseData
//                                                          error:error];
        DDLogInfo(@"响应失败~~~！错误码是：error == %@", error);
        if (nil != _delegate)
        { //通过代理通知业务层
            [self.delegate BBHttpRequestFailure:error];
        }
    }];
    
    [_operationManager.operationQueue addOperation:requestOperation];
}

#pragma mark - 获得请求响应结果
- (HttpResponse *)getResponseWithOperation:(AFHTTPRequestOperation *)operation
                              responseData:(id)responseData
                                     error:(NSError *)error

{
    HttpResponse *response = nil;
    if (operation.response)
    {
        int status =  (int)[operation.response statusCode];
        response = [[HttpResponse alloc] initWithStatus:status data:responseData];
    }
    else
    {
        response = [[HttpResponse alloc] initWithError:error];
    }
    
    return response;
}

@end

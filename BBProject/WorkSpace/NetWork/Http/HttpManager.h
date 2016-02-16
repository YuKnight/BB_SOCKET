//
//  HttpManager.h
//  BBProject
//
//  Created by qthd on 16/1/19.
//  Copyright © 2016年 蜻蜓互动. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpResponse.h"

@protocol HttpManagerDelegate; //回调代理
@interface HttpManager : NSObject

@property (nonatomic, assign) id <HttpManagerDelegate> delegate;

#pragma mark - HttpManager单例
+ (HttpManager *)shareHttpManager;

#pragma mark - 通过请求地址和请求数据发送请求
- (void)sendHttpRequestWithUrlString:(NSString *)urlString requestData:(NSData *)requestData;

@end


@protocol HttpManagerDelegate <NSObject>

- (void)BBHttpRequestSuccess:(HttpResponse *)response; //请求成功回调
- (void)BBHttpRequestFailure:(NSError *)error;         //请求失败回调

@end
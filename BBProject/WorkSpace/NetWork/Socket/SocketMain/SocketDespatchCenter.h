//
//  SocketDespatchCenter.h
//  BBProject
//
//  Created by qthd on 16/1/22.
//  Copyright © 2016年 蜻蜓互动. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SocketDespatchCenter : NSObject

#pragma mark - SocketDespatchCenter单例
+ (SocketDespatchCenter *)shareSocketDespatchCenter;

#pragma mark - 根据域名获取ip地址
- (NSString *)getIPWithHost:(const NSString *)host;

@end

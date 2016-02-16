//
//  BBTime.h
//  XXT
//
//  Created by 周 峰 on 13-7-15.
//  Copyright (c) 2013年 youjiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BBTime : NSObject

#pragma mark - date的时间戳
+ (NSTimeInterval)timestampWithDate:(NSDate*)date;
#pragma mark - 当前日期时间戳
+ (NSTimeInterval)timestamp;

#pragma mark - 获得日期
+ (NSDate *)currentDate;
+ (NSDate *)dataWithData:(NSDate *)data;
+ (NSDate *)dateWithtimestamp:(NSTimeInterval)timestamp;

#pragma mark - 毫秒(date传nil表示当前时间)
+ (NSInteger)millisecondWithDate:(NSDate *)date;

#pragma mark - 微秒(date传nil表示当前时间)
+ (NSInteger)microsecondWithDate:(NSDate *)date;

@end
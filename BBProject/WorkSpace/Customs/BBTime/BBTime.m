//
//  BBTime.m
//  XXT
//
//  Created by 周 峰 on 13-7-15.
//  Copyright (c) 2013年 youjiao. All rights reserved.
//

#import "BBTime.h"

@implementation BBTime

#pragma mark - date的时间戳
+ (NSTimeInterval)timestampWithDate:(NSDate*)date
{
    return [date timeIntervalSince1970];
}

#pragma mark - 当前日期时间戳
+ (NSTimeInterval)timestamp
{
    return [BBTime timestampWithDate:[NSDate date]];
}

#pragma mark - 获得日期
+ (NSDate *)currentDate
{
    return [BBTime dataWithData:[NSDate date]];
}
+ (NSDate *)dataWithData:(NSDate *)data
{
    NSTimeInterval timestamp = [BBTime timestampWithDate:data];
	return [NSDate dateWithTimeIntervalSince1970:timestamp];
}
+ (NSDate *)dateWithtimestamp:(NSTimeInterval)timestamp
{
    return [NSDate dateWithTimeIntervalSince1970:timestamp];
}

#pragma mark - 毫秒(date传nil表示当前时间)
+ (NSInteger)millisecondWithDate:(NSDate *)date
{
    NSTimeInterval timeInterval = [[NSDate date] timeIntervalSince1970];
    if (date != nil)
    {
        timeInterval = [date timeIntervalSince1970];
    }
    NSString *millisecond = [NSString stringWithFormat:@"%ld", (long)(timeInterval * 1000)];
    
    return [millisecond integerValue];
}

#pragma mark - 微秒(date传nil表示当前时间)
+ (NSInteger)microsecondWithDate:(NSDate *)date
{
    NSTimeInterval timeInterval = [[NSDate date] timeIntervalSince1970];
    if (date != nil)
    {
        timeInterval = [date timeIntervalSince1970];
    }
    NSString *microsecond = [NSString stringWithFormat:@"%ld", (long)(timeInterval * 1000 * 1000)];
    
    return [microsecond integerValue];
}

@end

//
//  NSString+King.h
//  BBProject
//
//  Created by qthd on 16/1/21.
//  Copyright © 2016年 蜻蜓互动. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (King)

#pragma mark - 判断NSString是不是都是空格或者空
+ (BOOL)isEmptyOrNull:(NSString *)string;

#pragma mark - 获取设备的UUID
+ (NSString *)getUUID;

#pragma mark - 密码加密处理(传阿波罗数据时需要这样加密下)
- (NSString *)passwordEncrypt;

#pragma mark - 手机号码正则表达式匹配
+ (BOOL)checkPhotoNumber:(NSString *)photoNumber;

#pragma mark - 检测密码合法性（密码由6-16位数字或字母组成）
+ (BOOL)checkPassword:(NSString *)password;

#pragma mark - 限制string的长度max (汉字算2字符)
+ (BOOL)limitString:(NSString *)string max:(int)max;

/*
    获取汉字拼音的首字母, 返回的字母是大写形式, 例如: @"俺妹", 返回 @"A".
    如果字符串开头不是汉字, 而是字母, 则直接返回该字母, 例如: @"b彩票", 返回 @"B".
    如果字符串开头不是汉字和字母, 则直接返回 @"#", 例如: @"&哈哈", 返回 @"#".
    字符串开头有特殊字符(空格,换行)不影响判定, 例如@"       a啦啦啦", 返回 @"A".
 */
#pragma mark - 取名字的拼音首字母
- (NSString *)nameFirstLetter;

#pragma mark - 将名字转成全拼（如"张三"转换后为"zhangsan"）
- (NSString *)nameToPinyin;

#pragma mark - 将名字转成拼音且只取首字母（如"张三"转换后为"zs"）
- (NSString *)nameToPinYinFirstLetter;

@end

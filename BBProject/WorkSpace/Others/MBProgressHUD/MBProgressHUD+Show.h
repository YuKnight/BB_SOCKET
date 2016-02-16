//
//  MBProgressHUD+Show.h
//  BBProject
//
//  Created by qthd on 16/1/13.
//  Copyright © 2016年 蜻蜓互动. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (Show)

#pragma mark - 显示纯文本提示框
+ (void)showTextPrompt:(NSString *)textPrompt inView:(UIView *)inView;

#pragma mark - 显示成功信息
+ (void)showSuccess:(NSString *)success inView:(UIView *)inView;

#pragma mark - 显示错误信息
+ (void)showError:(NSString *)error inView:(UIView *)inView;

#pragma mark - 显示提示
+ (MBProgressHUD *)showMessage:(NSString *)message inView:(UIView *)inView;

#pragma mark - 关闭HUD
+ (void)hideHUDInView:(UIView *)inView;

@end

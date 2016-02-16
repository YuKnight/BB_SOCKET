//
//  MBProgressHUD+Show.m
//  BBProject
//
//  Created by qthd on 16/1/13.
//  Copyright © 2016年 蜻蜓互动. All rights reserved.
//

#import "MBProgressHUD+Show.h"

@implementation MBProgressHUD (Show)

#pragma mark - 显示纯文本提示框
+ (void)showTextPrompt:(NSString *)textPrompt inView:(UIView *)inView
{
    if (inView == nil)
    { //容错处理
        inView = [[UIApplication sharedApplication].windows lastObject];
    }
    MBProgressHUD *progressHUD = [MBProgressHUD showHUDAddedTo:inView animated:YES];
    //设置属性
    progressHUD.labelText = textPrompt;
    progressHUD.margin = 15.0f;
    progressHUD.color = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.6f];
    progressHUD.mode = MBProgressHUDModeText;
    progressHUD.removeFromSuperViewOnHide = YES; //删除HUD时是否移除
    //2秒后自动消失
    [progressHUD hide:YES afterDelay:2.0f];
}

/**
 *  显示信息
 *
 *  @param text 信息内容
 *  @param icon 图标
 *  @param view 显示的视图
 */
+ (void)showText:(NSString *)text icon:(NSString *)icon inView:(UIView *)inView
{
    if (inView == nil)
    { //容错处理
        inView = [[UIApplication sharedApplication].windows lastObject];
    }
    //快速显示一个提示信息
    MBProgressHUD *progressHUD = [MBProgressHUD showHUDAddedTo:inView animated:YES];
    progressHUD.labelText = text;
    progressHUD.color = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.6f];
    progressHUD.margin = 15.0f;
    //设置图片
    UIImageView *customImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    customImageView.image = [UIImage imageNamedR:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@", icon]];
    progressHUD.customView = customImageView;
    //再设置模式
    progressHUD.mode = MBProgressHUDModeCustomView;
    //隐藏时候从父控件中移除
    progressHUD.removeFromSuperViewOnHide = YES;
    //2秒之后再消失
    [progressHUD hide:YES afterDelay:2.0f];
}

/**
 *  显示成功信息
 *
 *  @param success 信息内容
 *  @param view    显示信息的视图
 */
+ (void)showSuccess:(NSString *)success inView:(UIView *)inView
{
    [self showText:success icon:@"success.png" inView:inView];
}

/**
 *  显示错误信息
 *
 *  @param error 错误信息内容
 *  @param view  需要显示信息的视图
 */
+ (void)showError:(NSString *)error inView:(UIView *)inView
{
    [self showText:error icon:@"error.png" inView:inView];
}

/**
 *  显示一些信息
 *
 *  @param message 信息内容
 *  @param view    需要显示信息的视图
 *
 *  @return 直接返回一个MBProgressHUD，需要手动关闭
 */
+ (MBProgressHUD *)showMessage:(NSString *)message inView:(UIView *)inView
{
    if (inView == nil)
    { //容错处理
        inView = [[UIApplication sharedApplication].windows lastObject];
    }
    //快速显示一个提示信息
    MBProgressHUD *progressHUD = [MBProgressHUD showHUDAddedTo:inView animated:YES];
    progressHUD.labelText = message;
    progressHUD.margin = 15.0f;
    progressHUD.color = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.6f];
    //隐藏时候从父控件中移除
    progressHUD.removeFromSuperViewOnHide = YES;
//    //YES代表需要蒙版效果
//    progressHUD.dimBackground = YES;
    
    return progressHUD;
}

/**
 *  手动关闭MBProgressHUD
 *
 *  @param view 显示MBProgressHUD的视图
 */
+ (void)hideHUDInView:(UIView *)inView
{
    if (inView == nil)
    {
        inView = [[UIApplication sharedApplication].windows lastObject];
    }
    [self hideHUDForView:inView animated:YES];
}

@end

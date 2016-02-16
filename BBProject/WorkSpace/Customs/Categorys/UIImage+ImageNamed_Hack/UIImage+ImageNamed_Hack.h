//
//  UIImage (ImageNamed_Hack)
//  BBProject
//  UIImage类别imageNamedR，优化内存
//  Created by qthd on 16/1/14.
//  Copyright © 2016年 蜻蜓互动. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ImageNamed_Hack)

#pragma mark - 从本地加载图片，项目中所有加载图片方式都用该方法加载！！！
+ (UIImage *)imageNamedR:(NSString *)name;

#pragma mark - 手动实现图片压缩（按照图片大小进行等比例压缩，改变了图片的尺寸）
+ (UIImage *)compressionImage:(UIImage *)image scale:(float)scale;

@end

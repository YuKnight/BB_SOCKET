//
//  UIImage (ImageNamed_Hack)
//  BBProject
//  
//  Created by qthd on 16/1/14.
//  Copyright © 2016年 蜻蜓互动. All rights reserved.
//

#import "UIImage+ImageNamed_Hack.h"

@implementation UIImage (ImageNamed_Hack)

#pragma mark - 从本地加载图片，项目中所有加载图片方式都用该方法加载！！！
+ (UIImage *)imageNamedR:(NSString *)name
{
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:name ofType:@".png"];
    return [UIImage imageWithContentsOfFile:imagePath];
}

#pragma mark - 手动实现图片压缩（按照图片大小进行等比例压缩，改变了图片的尺寸）
+ (UIImage *)compressionImage:(UIImage *)image scale:(float)scale
{
    UIImage *thumbnail = nil;
    CGSize imageSize = CGSizeMake(image.size.width * scale, image.size.height * scale);
    if ((image.size.width != imageSize.width) ||
        (image.size.height != imageSize.height))
    {
        UIGraphicsBeginImageContext(imageSize);
        CGRect imageRect = CGRectMake(0.0, 0.0, imageSize.width, imageSize.height);
        [image drawInRect:imageRect];
        thumbnail = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    else
    {
        thumbnail = image;
    }
    
    return thumbnail;
}

@end

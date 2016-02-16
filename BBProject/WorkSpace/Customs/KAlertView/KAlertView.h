//
//  KAlertView.h
//  BBProject
//  将UIAlertView改写为block形式
//  Created by qthd on 16/1/12.
//  Copyright © 2016年 蜻蜓互动. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KAlertView : UIAlertView

#pragma mark - 带回调的alert
+ (id)showAlertViewWithMessage:(NSString *)message
               completionBlock:(void (^)(NSUInteger buttonIndex, KAlertView *alertView))block
             cancelButtonTitle:(NSString *)cancelButtonTitle
             otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;

@end

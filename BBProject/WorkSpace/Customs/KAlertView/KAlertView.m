//
//  KAlertView.m
//  BBProject
//
//  Created by qthd on 16/1/12.
//  Copyright © 2016年 蜻蜓互动. All rights reserved.
//

#import "KAlertView.h"
#import <QuartzCore/QuartzCore.h>
#import <objc/runtime.h>

@implementation KAlertView

#pragma mark - showBackAlertWithMessage
+ (id)showAlertViewWithMessage:(NSString *)message
               completionBlock:(void (^)(NSUInteger buttonIndex, KAlertView *alertView))block
             cancelButtonTitle:(NSString *)cancelButtonTitle
             otherButtonTitles:(NSString *)otherButtonTitles, ...
{
    KAlertView *alertView = [[self alloc] initBackWithTitle:@"温馨提示" message:message completionBlock:block cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil];
    if (otherButtonTitles != nil)
    {
        id eachObject;
        va_list argumentList;
        if (otherButtonTitles)
        {
            [alertView addButtonWithTitle:otherButtonTitles];
            va_start(argumentList, otherButtonTitles);
            while ((eachObject = va_arg(argumentList, id)))
            {
                [alertView addButtonWithTitle:eachObject];
            }
            va_end(argumentList);
        }
    }
    [alertView show];
    
    return alertView;
}

#pragma mark - initBackWithTitle
- (id)initBackWithTitle:(NSString *)title
                message:(NSString *)message
        completionBlock:(void (^)(NSUInteger buttonIndex, KAlertView *alertView))block
      cancelButtonTitle:(NSString *)cancelButtonTitle
      otherButtonTitles:(NSString *)otherButtonTitles, ...
{
	objc_setAssociatedObject(self, "blockCallback", [block copy], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
	if (self = [self initWithTitle:title message:message delegate:self cancelButtonTitle:nil otherButtonTitles:nil])
    {
		if (cancelButtonTitle)
        {
			[self addButtonWithTitle:cancelButtonTitle];
			self.cancelButtonIndex = [self numberOfButtons] - 1;
		}
		
		id eachObject;
		va_list argumentList;
		if (otherButtonTitles)
        {
			[self addButtonWithTitle:otherButtonTitles];
			va_start(argumentList, otherButtonTitles);
			while ((eachObject = va_arg(argumentList, id)))
            {
				[self addButtonWithTitle:eachObject];
			}
			va_end(argumentList);
		}
	}
    
	return self;
}

#pragma mark - clickedButtonAtIndex
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	void (^block)(NSUInteger buttonIndex, UIAlertView *alertView) = objc_getAssociatedObject(self, "blockCallback");
    if (block)
    {
        block(buttonIndex, self);
    }
}

@end


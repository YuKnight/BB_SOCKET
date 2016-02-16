//
//  KWarnLabel.m
//  BBProject
//
//  Created by qthd on 16/1/15.
//  Copyright © 2016年 蜻蜓互动. All rights reserved.
//

#import "KWarnLabel.h"

@implementation KWarnLabel

- (instancetype)initWithLabelX:(CGFloat)labelX labelY:(CGFloat)labelY count:(int)count
{
    self = [super initWithFrame:CGRectMake(labelX, labelY, 18, 18)];
    if (self)
    {
        //添加圆角label提示
        self.backgroundColor = [UIColor redColor];
        self.textAlignment = NSTextAlignmentCenter;
        self.textColor = [UIColor whiteColor];
        self.font = [UIFont boldSystemFontOfSize:11.0f];
        if (count < 99)
        { //超过99条的话显示99条
            self.text = [NSString stringWithFormat:@"%d", count];
        }
        else
        {
            self.text = [NSString stringWithFormat:@"%d", 99];
        }
        self.clipsToBounds = YES;
        self.layer.cornerRadius = 9.0f;
    }

    return self;
}

@end

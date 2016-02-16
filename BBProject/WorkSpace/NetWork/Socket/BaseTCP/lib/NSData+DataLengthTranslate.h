//
//  NSData+DataLengthTranslate.h
//  BBProject
//
//  Created by qthd on 16/2/1.
//  Copyright © 2016年 蜻蜓互动. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (DataLengthTranslate)

/**
 *  由int型数据转换成data数据
 *
 *  @param length 需要转换的int值 ,<= 65535
 *
 *  @return 返回length值对应的data数据
 *
 *  注意：该方法只能做2字节int型的转换，因此能转换的最大值：65535
 */
+ (NSData *)socketBC_DataWithLength:(int)length;


/**
 *  由data数据转换成int型数据
 *
 *  @param data data数据
 *
 *  @return 返回data对应的int值
 *
 *  注意：该方法只能做2字节int型的转换，因此能转换的最大值：65535
 */
+ (NSInteger)socketBC_DataLength:(NSData *)data;



@end

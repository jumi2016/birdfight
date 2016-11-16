//
//  NSString+Bird.h
//  BirdFight
//
//  Created by 聚米 on 16/10/13.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Bird)

/**
 *  获取文字长宽的方法
 */
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

/**
 *  获取document路径
 *
 *  @param fileName 文件名
 *
 *  @return string型document路径
 */
+ (NSString *)documentPathWith:(NSString *)fileName;

/**
 *  判断是否是邮件格式
 */
- (BOOL)isEmail;

/**
 *  判断是否是URL
 */
- (BOOL)isUrl;

/**
 *  判断是否是电话号码
 */
- (BOOL)isMobilePhoneNumber;

/**
 *  统计含中英文混编的NSString字符串长度
 */
- (NSInteger)charLength;


@end

//
//  NSDate+Bird.h
//  BirdFight
//
//  Created by 聚米 on 16/10/27.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DefaultFormatter @"yyyy-MM-dd HH:mm:ss" // 默认格式
#define WeiBoDateFormatter @"EEE MMM dd HH:mm:ss Z yyyy" // 微博格式

@interface NSDate (Bird)

/**
 *  根据formatter快速将string型的date转换为Date型(formatter的格式必须与传入的string格式一致）
 */
+ (NSDate *)dateFromString:(NSString *)dateString WithDateFormatter:(NSString *)formatter;

/**
 *  根据formatter快速将Date型date转换为string型(formatter的格式必须与传入的string格式一致）
 */
+ (NSString *)stringFromDate:(NSDate *)date WithDateFormatter:(NSString *)formatter;

/**
 *  获取距离当前时间的时间间隔,返回"XX分钟"前的字符串格式
 *
 *  @param time      字符串型Date时间
 *  @param formatter 设置输出格式[输出格式与字符串格式必须一致,否则全部返回刚刚]
 *
 *  @return XX分钟前/XX小时前。。。。
 */
+ (NSString *)dateTimeIntervalWithTimeString:(NSString *)time DateFormatter:(NSString *)formatter;

/**
 *  获取精确到分钟的日期,返回"昨天 HH:mm"的字符串格式
 *
 *  @param time      字符串型Date时间
 *  @param formatter 设置输出格式[输出格式与字符串格式必须一致]
 *
 *  @return 今天 HH:mm/昨天 HH:mm
 */
+ (NSString *)dateMinuteWithTimeString:(NSString *)time DateFormatter:(NSString *)formatter;

/**
 *  传入秒数转换为Date型时间
 *
 *  @param totalSeconds 总共的秒数
 *
 *  @return 返回Date型时间
 */
+ (NSDate *)timeFormatted:(long long)totalSeconds;

/**
 *  传入秒数转换为String型时间
 *
 *  @param totalSeconds 总共的秒数
 *
 *  @return 返回String型时间
 */
+ (NSString *)timeFormattedString:(long long)totalSeconds;


/*
 date与String的转换
 
 |-----返回date型时间(2015-10-19 07:20:00 +0000)-----|
 NSDate *date = [NSDate dateFromString:@"2015-10-16 15:20" WithDateFormatter:@"yyyy-MM-dd HH:mm"];
 
 
 |-----返回string型时间(2015-10-19 22:33:39)-----|
 NSString *dateString = [NSDate stringFromDate:[NSDate date] WithDateFormatter:DefaultFormatter];
 
 */


@end

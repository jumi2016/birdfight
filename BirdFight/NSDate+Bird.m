//
//  NSDate+Bird.m
//  BirdFight
//
//  Created by 聚米 on 16/10/27.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import "NSDate+Bird.h"

@implementation NSDate (Bird)

#pragma mark 转化时间
+ (NSDate *)dateFromString:(NSString *)dateString WithDateFormatter:(NSString *)formatter
{
    // 初始化输出格式
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    // 判断有没有传入格式
    if (formatter == nil) {
        // 设置输出格式为默认
        [dateFormatter setDateFormat:DefaultFormatter];
        // 设置输出区域格式
        [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
        // 将String型的Date转换为NSDate
        return [dateFormatter dateFromString:dateString];
    }
    else
    {
        // 设置输出格式
        [dateFormatter setDateFormat:formatter];
        // 设置输出区域格式
        [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
        // 将String型的Date转换为NSDate
        return [dateFormatter dateFromString:dateString];
    }
    return nil;
}

+ (NSString *)stringFromDate:(NSDate *)date WithDateFormatter:(NSString *)formatter
{
    // 初始化输出格式
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    // 判断有没有传入格式
    if (formatter == nil) {
        // 设置输出格式为默认
        [dateFormatter setDateFormat:DefaultFormatter];
        // 设置输出区域格式
        [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
        // 将String型的Date转换为NSDate
        return [dateFormatter stringFromDate:date];
    }
    else
    {
        // 设置输出格式
        [dateFormatter setDateFormat:formatter];
        // 设置输出区域格式
        [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
        // 将String型的Date转换为NSDate
        return [dateFormatter stringFromDate:date];
    }
    return nil;
}

#pragma mark 格式化返回“XX分钟前“
+ (NSString *)dateTimeIntervalWithTimeString:(NSString *)time DateFormatter:(NSString *)formatter
{
    // 1> 初始化输出格式
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    // 2> 设置输出格式
    [dateFormatter setDateFormat:formatter];
    // 3> 设置输出区域格式
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    
    // 4> 将String型的Date转换为NSDate
    NSDate *date = [dateFormatter dateFromString:time];
    
    // 5> 获取时间间隔
    NSInteger timeInterval = -[date timeIntervalSinceNow];
    
    // 6> 判断返回形式
    long temp = 0;
    NSString *result;
    if (timeInterval < 60) {
        result = [NSString stringWithFormat:@"刚刚"];
    }
    else if((temp = timeInterval/60) <60){
        result = [NSString stringWithFormat:@"%ld分钟前",temp];
    }
    
    else if((temp = temp/60) <24){
        result = [NSString stringWithFormat:@"%ld小时前",temp];
    }
    
    else if((temp = temp/24) <30){
        result = [NSString stringWithFormat:@"%ld天前",temp];
    }
    
    else if((temp = temp/30) <12){
        result = [NSString stringWithFormat:@"%ld月前",temp];
    }
    else{
        temp = temp/12;
        result = [NSString stringWithFormat:@"%ld年前",temp];
    }
    return result;
    
}

#pragma mark 格式化返回“今天 HH:mm“
+ (NSString *)dateMinuteWithTimeString:(NSString *)time DateFormatter:(NSString *)formatter
{
    // 初始化输出格式
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    // 设置输出格式
    [dateFormatter setDateFormat:formatter];
    
    // 设置输出区域格式
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    // 将String型的Date转换为NSDate
    NSDate *date = [dateFormatter dateFromString:time];
    // 设置输出格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    // 当前日期
    NSString *currentDay = [dateFormatter stringFromDate:[NSDate date]];// 当前年月日 string型
    NSDate *CurrentDate = [dateFormatter dateFromString:currentDay]; // date型
    
    // 需要转换的日期
    NSString *theDay = [dateFormatter stringFromDate:date];//需要转换的日期 string型
    NSDate *Date_t = [dateFormatter dateFromString:theDay];// date型
    
    if ([theDay isEqualToString:currentDay]) // 今天
    {
        [dateFormatter setDateFormat:@"HH:mm"];
        return [NSString stringWithFormat:@"今天 %@", [dateFormatter stringFromDate:date]];
    }
    else if ([CurrentDate timeIntervalSinceDate:Date_t] == 86400)
    {//昨天 24*60*60
        [dateFormatter setDateFormat:@"HH:mm"];
        return [NSString stringWithFormat:@"昨天 %@", [dateFormatter stringFromDate:date]];
    }
    else if ([CurrentDate timeIntervalSinceDate:Date_t] == 86400*2)
    {//昨天 24*60*60
        [dateFormatter setDateFormat:@"HH:mm"];
        return [NSString stringWithFormat:@"前天 %@", [dateFormatter stringFromDate:date]];
    }
    else
    {//以前
        [dateFormatter setDateFormat:@"MM-dd HH:mm"];
        return [dateFormatter stringFromDate:date];
    }
}

+ (NSDate *)timeFormatted:(long long)totalSeconds
{
    NSDate  *date = [NSDate dateWithTimeIntervalSince1970:totalSeconds];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: date];
    NSDate *localeDate = [date dateByAddingTimeInterval: interval];
    
    return localeDate;
}

+ (NSString *)timeFormattedString:(long long)totalSeconds
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:totalSeconds];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[NSLocale currentLocale]];
    [formatter setDateFormat:DefaultFormatter];
    
    return [formatter stringFromDate:date];
    
}



@end

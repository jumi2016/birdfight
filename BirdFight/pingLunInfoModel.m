//
//  pingLunInfoModel.m
//  BirdFight
//
//  Created by 聚米 on 16/10/31.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import "pingLunInfoModel.h"
#import "NSDate+Bird.h"

@implementation pingLunInfoModel

#pragma mark 头像URL
//- (NSURL *)headImage_t
//{
//
//    return [NSURL URLWithString:_headImage];
//}


#pragma mark 日记时间
- (NSString *)time_t
{
    return [NSDate dateTimeIntervalWithTimeString:self.time DateFormatter:DefaultFormatter];
}


#pragma mark 解析文本消息
+ (pingLunInfoModel *)serializeDiaryWithDict:(NSDictionary *)dict
{
    pingLunInfoModel * action = [[pingLunInfoModel alloc]init];
    
    
    
    return action;
}



@end

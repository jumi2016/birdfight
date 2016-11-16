//
//  ActionInfoModel.m
//  BirdFight
//
//  Created by 聚米 on 16/10/31.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import "ActionInfoModel.h"
#import "NSDate+Bird.h"

@implementation ActionInfoModel

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


@end

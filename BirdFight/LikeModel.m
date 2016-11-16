 //
//  LikeModel.m
//  BirdFight
//
//  Created by 聚米 on 16/11/11.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import "LikeModel.h"
#import "NSDate+Bird.h"

@implementation LikeModel

#pragma mark 头像URL
- (NSURL *)headImage_t
{
    
    return [NSURL URLWithString:_headImage];
    
}

#pragma mark 日记时间
- (NSString *)time_t
{
    return [NSDate dateTimeIntervalWithTimeString:self.time DateFormatter:DefaultFormatter];
}


@end

//
//  ImageActionModel.m
//  BirdFight
//
//  Created by 聚米 on 16/10/31.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import "ImageActionModel.h"

@implementation ImageActionModel

#pragma mark 解析图片消息
+ (ImageActionModel *)serializeDiaryWithDict:(NSDictionary *)dict
{
    ImageActionModel * action = [[ImageActionModel alloc] init];
    
    
    
    
    return action;
}


#pragma mark 解析图片数组
- (NSArray *)images_url
{
    NSArray *arr = [self.imageUrl componentsSeparatedByString:@"|"];
    NSMutableArray *m_arr = [NSMutableArray arrayWithArray:arr];
    [m_arr removeLastObject]; // 最后一个是空 移除
    return [NSArray arrayWithArray:m_arr];
}



@end

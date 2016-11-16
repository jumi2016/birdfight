//
//  VideoActionModel.h
//  BirdFight
//
//  Created by 聚米 on 16/10/31.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import "ActionInfoModel.h"

@interface VideoActionModel : ActionInfoModel

/**
 *  视频的服务器路径
 */
//@property(nonatomic,strong) NSString *video_url;

@property (nonatomic,copy) NSString *title; // 题目
@property (nonatomic,copy) NSString *detailDes; // 描述
@property (nonatomic,copy) NSString *coverIMG; // 覆盖图
@property (nonatomic,copy) NSString *mp4URL; // 视频URL
@property (nonatomic,copy) NSString *ptime; // 时长
@property (nonatomic,assign) NSUInteger playCount; // 播放数量


@end

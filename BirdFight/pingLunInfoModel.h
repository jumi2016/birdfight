//
//  pingLunInfoModel.h
//  BirdFight
//
//  Created by 聚米 on 16/10/31.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface pingLunInfoModel : NSObject

/** 评论编号 */
@property(nonatomic,strong) NSString * cid;
/** 类型 */
@property(nonatomic,strong) NSString * pinglun_type;
/** 用户一头像 */
@property(nonatomic,strong) UIImage * headImage;
/** 用户编号一 */
@property(nonatomic,strong) NSString * uid_one;
/** 名字 */
@property(nonatomic,strong) NSString * name_one;
/** 用户编号二 */
@property(nonatomic,strong) NSString * uid_two;
/** 名字 */
@property(nonatomic,strong) NSString * name_two;
/** 文本内容 */
@property(nonatomic,strong) NSString * content;
/** 距离 */
@property(nonatomic,strong) NSString * distance;
/** 时间 */
@property(nonatomic,strong) NSString * time;


/* -------- 需要转换的属性 ----------*/

/** 用户头像[UIImage] */
@property(nonatomic,strong,readonly) NSURL * headImage_t;

/** 日记时间[XX分钟前] */
@property(nonatomic,strong,readonly) NSString * time_t;

/**
 *  解析消息
 *
 *  @param dict 传入的单个消息
 *
 *  @return 返回相应消息对象
 */
+ (instancetype)serializeDiaryWithDict:(NSDictionary *)dict;



@end

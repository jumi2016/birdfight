//
//  ActionInfoModel.h
//  BirdFight
//
//  Created by 聚米 on 16/10/31.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ActionInfoModel : NSObject


/** 用户编号 */
@property(nonatomic,strong) NSString * uid;
/** 动态编号 */
@property(nonatomic,strong) NSString * cid;
/** 动态类型 */
@property(nonatomic,strong) NSString * action_type;
/** 头像 */
@property(nonatomic,strong) UIImage * headImage;
/** 名字 */
@property(nonatomic,strong) NSString * name;
/** 性别 */
@property(nonatomic,strong) NSString * sex;
/** 年龄 */
@property(nonatomic,strong) NSString * age;
/** 位置 */
@property(nonatomic,strong) NSString * location;
/** 距离 */
@property(nonatomic,strong) NSString * stance;
/** 赞 */
@property(nonatomic,strong) NSString * zanCount;
/** 评论 */
@property(nonatomic,strong) NSString * pinglunCount;
/** 文本内容 */
@property(nonatomic,strong) NSString *content;
/** 发布日记的时间 */
@property(nonatomic,strong) NSString *time;

// 赞数组
@property (nonatomic, strong) NSMutableArray *zan_Arr;

// 评论数据源
@property (nonatomic, strong) NSMutableArray *commentModels;

// 因为评论是动态的，因此要标识是否要更新缓存
@property (nonatomic, assign) BOOL shouldUpdateCache;


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

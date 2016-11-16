//
//  LikeModel.h
//  BirdFight
//
//  Created by 聚米 on 16/11/11.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LikeModel : NSObject

/** 用户编号 */
@property(nonatomic,strong) NSString * uid;
/** 头像 */
@property(nonatomic,strong) UIImage * headImage;
/** 名字 */
@property(nonatomic,strong) NSString * name;
/** 性别 */
@property(nonatomic,strong) NSString * sex;
/** 年龄 */
@property(nonatomic,strong) NSString * age;
/** 时间 */
@property(nonatomic,strong) NSString * time;
/** 位置 */
@property(nonatomic,strong) NSString * location;
/** 距离 */
@property(nonatomic,strong) NSString * distance;
/** 类型 */
@property(nonatomic,strong) NSString * type;


/* -------- 需要转换的属性 ----------*/

/** 用户头像[UIImage] */
@property(nonatomic,strong,readonly) NSURL * headImage_t;

/** 日记时间[XX分钟前] */
@property(nonatomic,strong,readonly) NSString * time_t;

@end

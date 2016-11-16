//
//  UserInfo.h
//  BirdFight
//
//  Created by 聚米 on 16/10/24.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UserInfo : NSObject

/** 用户编号 */
@property(nonatomic,strong) NSString * uid;
/** 头像 */
@property(nonatomic,strong) UIImage * headImage;
/** 名字 */
@property(nonatomic,strong) NSString * name;
/** 会员 */
@property(nonatomic,strong) NSString * vip;
/** 性别 */
@property(nonatomic,strong) NSString * sex;
/** 年龄 */
@property(nonatomic,strong) NSString * age;
/** 位置 */
@property(nonatomic,strong) NSString * location;
/** 距离 */
@property(nonatomic,strong) NSString * stance;
/** 个性签名 */
@property(nonatomic,strong) NSString * sign;
/** 喜欢我的数量 */
@property(nonatomic,strong) NSString * like_count;
/** 喜欢我的数组 */
@property(nonatomic,strong) NSMutableArray * loveMe_arr;
/** 我喜欢的数组 */
@property(nonatomic,strong) NSMutableArray * meLove_arr;

/* -------- 需要转换的属性 ----------*/

/** 用户头像[UIImage] */
@property(nonatomic,strong,readonly) NSURL * headImage_t;


@end

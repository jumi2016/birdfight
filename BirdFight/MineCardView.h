//
//  MineCardView.h
//  BirdFight
//
//  Created by 聚米 on 16/11/10.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserInfo.h"

typedef void(^TapHeadImageBlock)();

@interface MineCardView : UIView

@property (nonatomic, strong) TapHeadImageBlock block;

// uid
@property (nonatomic, strong) NSString * uid;
// 头像
@property (nonatomic, strong) UIButton *imageView;
// 姓名
@property (nonatomic, strong) UILabel *nameLabel;
// 位置
@property (nonatomic, strong) UILabel *locationLabel;
// 喜欢数
@property (nonatomic, strong) UILabel *like_count;
// 性别
@property (nonatomic, strong) UIImageView *sexImageView;
// 年龄
@property (nonatomic, strong) UILabel *ageLabel;
// 个性签名
@property (nonatomic, strong) UILabel *signLabel;
// view
@property (nonatomic, strong) UIView *lineView;

-(instancetype)initWithFrame:(CGRect)frame withUserInfo:(UserInfo *)info;

@property (nonatomic, strong) UserInfo * info; // 个人信息

@end

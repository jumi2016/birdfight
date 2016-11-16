//
//  CardView.h
//  仿陌陌点点切换
//
//  Created by zjwang on 16/3/28.
//  Copyright © 2016年 Xsummerybc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardView : UIView

// uid
@property (nonatomic, strong) NSString * uid;
// 头像
@property (nonatomic, strong) UIImageView *imageView;
// 姓名
@property (nonatomic, strong) UILabel *nameLabel;
// 距离
@property (nonatomic, strong) UILabel *distanceLabel;
// 性别
@property (nonatomic, strong) UIImageView *sexImageView;
// 年龄
@property (nonatomic, strong) UILabel *ageLabel;
// 个性签名
@property (nonatomic, strong) UILabel *signLabel;

@end

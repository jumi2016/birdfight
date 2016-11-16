//
//  PeoplaeNearbyView.m
//  BirdFight
//
//  Created by 聚米 on 16/10/26.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import "PeoplaeNearbyView.h"
#import "BaseMethod.h"

#define VIEW_WIDTH self.bounds.size.width
#define VIEW_HEIGHT self.bounds.size.height
#define vip_1 @"季会员"
#define vip_2 @"半年会员"
#define vip_3 @"年会员"
#define vip_4 @"超级会员"

@interface PeoplaeNearbyView ()

/** vip */
@property (nonatomic, strong) UIImageView * vip_image;
/** 姓名 */
@property (nonatomic, strong) UILabel * nameLabel;
/** 性别 */
@property (nonatomic, strong) UIImageView * sex_image;
/** 年龄 */
@property (nonatomic, strong) UILabel * ageLabel;
/** 点 */
@property (nonatomic, strong) UIView * point_view;
/** 距离 */
@property (nonatomic, strong) UILabel * stanceLabel;

@end

@implementation PeoplaeNearbyView

#pragma mark 初始化
-(instancetype)initWithFrame:(CGRect)frame withPeopleInfo:(UserInfo *)info
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _info = info;
        [self otherInit];
        
    }
    return self;
}

#pragma mark 初始化
- (void)awakeFromNib
{
    [super awakeFromNib];
    [self otherInit];
}

#pragma mark 方法
-(void)otherInit
{
    self.backgroundColor = [UIColor clearColor];
    
//    UIImage * image = [UIImage imageWithData:[NSData dataWithContentsOfURL:_info.headImage_t]];
//    NSLog(@"headImage ===== %@",_info.headImage);
//    NSLog(@"image ==== %@",image);
    _headImageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _headImageBtn.frame = CGRectMake(7, 7, VIEW_WIDTH-14, VIEW_WIDTH-14);
    [_headImageBtn setImage:_info.headImage forState:UIControlStateNormal];
    _headImageBtn.layer.cornerRadius = _headImageBtn.bounds.size.width/2;
    _headImageBtn.layer.masksToBounds = YES;
    [_headImageBtn addTarget:self action:@selector(tapHeadImage:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_headImageBtn];
    
    _vip_image = [[UIImageView alloc]initWithFrame:CGRectMake(VIEW_WIDTH/2+20, VIEW_WIDTH-27, 20, 20)];
    _vip_image.backgroundColor = [UIColor clearColor];
    NSString * str = _info.vip;
    if ([str isEqualToString:vip_1]) {
        _vip_image.image = [UIImage imageNamed:@"season"];
    }else if ([str isEqualToString:vip_2]){
        _vip_image.image = [UIImage imageNamed:@"Six months"];
    }else if ([str isEqualToString:vip_3]){
        _vip_image.image = [UIImage imageNamed:@"年会员-01"];
    }else if ([str isEqualToString:vip_4]){
        _vip_image.image = [UIImage imageNamed:@"super"];
    }
    [self addSubview:_vip_image];
    
    _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, VIEW_WIDTH-6, VIEW_WIDTH-10, 20)];
    _nameLabel.text = _info.name;
    _nameLabel.textAlignment = NSTextAlignmentCenter;
    _nameLabel.font = [UIFont systemFontOfSize:14];
    _nameLabel.textColor = [UIColor whiteColor];
    _nameLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:_nameLabel];
    
    _sex_image = [[UIImageView alloc]initWithFrame:CGRectMake(VIEW_WIDTH/2-30, VIEW_WIDTH+15, 6, 9)];
    if ([_info.sex isEqualToString:@"男"]) {
        _sex_image.image = [UIImage imageNamed:@"nan_people"];
    }else if([_info.sex isEqualToString:@"女"]){
        _sex_image.image = [UIImage imageNamed:@"nv_people"];
    }
    [self addSubview:_sex_image];
    
    _ageLabel = [[UILabel alloc]initWithFrame:CGRectMake(VIEW_WIDTH/2-19, VIEW_WIDTH+14, 15, 10)];
    _ageLabel.text = _info.age;
    _ageLabel.textAlignment = NSTextAlignmentCenter;
    _ageLabel.font = [UIFont systemFontOfSize:10];
    _ageLabel.textColor = [UIColor whiteColor];
    _ageLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:_ageLabel];
    
    _point_view = [[UIView alloc]initWithFrame:CGRectMake(VIEW_WIDTH/2-3, VIEW_WIDTH+18, 2, 2)];
    _point_view.backgroundColor = [UIColor whiteColor];
    [self addSubview:_point_view];
    
    
//    CLLocation * mine = [[CLLocation alloc] initWithLatitude:32.178722 longitude:119.508619];
//    NSLog(@"我的坐标位置=====%@",[NSString stringWithFormat:@"%@",mine]);
//    CLLocation * peop = [[CLLocation alloc]initWithLatitude:30.178722 longitude:119.508619];
//    NSLog(@"他的坐标位置=====%@",peop);
//    NSString * str_text = [NSString stringWithFormat:@"%fm",[BaseMethod getDistanceWithlocationA:mine AndlocationB:peop]];
//    NSString * distance = [BaseMethod getNormalDistanceWith:str_text];
    
    
    _stanceLabel = [[UILabel alloc]initWithFrame:CGRectMake(VIEW_WIDTH/2, VIEW_WIDTH+14, 50, 10)];
    _stanceLabel.text = _info.stance;
    _stanceLabel.textAlignment = NSTextAlignmentLeft;
    _stanceLabel.font = [UIFont systemFontOfSize:10];
    _stanceLabel.textColor = [UIColor whiteColor];
    _stanceLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:_stanceLabel];
}

#pragma mark 点击头像方法
-(void)tapHeadImage:(UIButton *)button
{
    
    if (self.block) {
        self.block();
    }
}

@end

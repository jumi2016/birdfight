//
//  MineCardView.m
//  BirdFight
//
//  Created by 聚米 on 16/11/10.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import "MineCardView.h"

@implementation MineCardView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame withUserInfo:(UserInfo *)info
{
    self = [super initWithFrame:frame];
    if (self) {
        _info = info;
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    
    // Corner Radius
    self.layer.cornerRadius = 6.0;
    
    self.backgroundColor = [UIColor whiteColor];
    
    // Custom view
    [self addSubview:self.imageView];
    _imageView.frame = CGRectMake(5, 5, self.frame.size.width - 10, (self.frame.size.height/3)*2);
    _imageView.backgroundColor = [UIColor clearColor];
    [_imageView setImage:_info.headImage forState:UIControlStateNormal];
    [_imageView addTarget:self action:@selector(tapImageButton) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:self.nameLabel];
    _nameLabel.frame = CGRectMake(20, _imageView.frame.size.height + 10, 120, 30);
    _nameLabel.backgroundColor = [UIColor clearColor];
    _nameLabel.textColor = [UIColor blackColor];
    _nameLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
    _nameLabel.textAlignment = NSTextAlignmentLeft;
     _nameLabel.text = _info.name;
    
    [self addSubview:self.locationLabel];
    _locationLabel.frame = CGRectMake(self.frame.size.width-80, _imageView.frame.size.height + 15, 70, 20);
    _locationLabel.backgroundColor = [UIColor clearColor];
    _locationLabel.textColor = [UIColor lightGrayColor];
    _locationLabel.font = [UIFont systemFontOfSize:13];
    _locationLabel.textAlignment = NSTextAlignmentRight;
    _locationLabel.text = _info.location;
    
    [self addSubview:self.like_count];
    _like_count.frame = CGRectMake(self.frame.size.width-70, _imageView.frame.size.height + 40, 60, 20);
    _like_count.backgroundColor = [UIColor clearColor];
    _like_count.textColor = [UIColor lightGrayColor];
    _like_count.font = [UIFont systemFontOfSize:13];
    _like_count.textAlignment = NSTextAlignmentRight;
    _like_count.text = _info.like_count;
    
    [self addSubview:self.sexImageView];
    _sexImageView.frame = CGRectMake(20, _imageView.frame.size.height + 45, 7, 10);
    _sexImageView.backgroundColor = [UIColor whiteColor];
    if ([_info.sex isEqualToString:@"男"]) {
        _sexImageView.image = [UIImage imageNamed:@"nan_people"];
    }else if([_info.sex isEqualToString:@"女"]){
        _sexImageView.image = [UIImage imageNamed:@"nv_people"];
    }

    
    [self addSubview:self.ageLabel];
    _ageLabel.frame = CGRectMake(32, _imageView.frame.size.height + 45, 30, 10);
    _ageLabel.backgroundColor = [UIColor clearColor];
    _ageLabel.textColor = [UIColor lightGrayColor];
    _ageLabel.font = [UIFont systemFontOfSize:13];
    _ageLabel.textAlignment = NSTextAlignmentCenter;
    _ageLabel.text = _info.age;
    
    [self addSubview:self.lineView];
    _lineView.frame = CGRectMake(20, _imageView.frame.size.height + 65, self.frame.size.width-30, 1);
    _lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    
    [self addSubview:self.signLabel];
    _signLabel.frame = CGRectMake(20, _imageView.frame.size.height + 75, self.frame.size.width-40, 30);
    _signLabel.backgroundColor = [UIColor clearColor];
    _signLabel.textColor = [UIColor darkGrayColor];
    _signLabel.font = [UIFont systemFontOfSize:15];
    _signLabel.textAlignment = NSTextAlignmentLeft;
    _signLabel.text = _info.sign;
    
}

#pragma mark 点击头像按钮
-(void)tapImageButton
{
    if (self.block) {
        self.block();
    }
}

#pragma mark 初始化
- (UIView *)lineView
{
    if (_lineView == nil) {
        _lineView = [[UIView alloc] init];
    }
    return _lineView;
}
- (UILabel *)nameLabel
{
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
    }
    return _nameLabel;
}
- (UILabel *)locationLabel
{
    if (_locationLabel == nil) {
        _locationLabel = [[UILabel alloc] init];
    }
    return _locationLabel;
}
- (UILabel *)like_count
{
    if (_like_count == nil) {
        _like_count = [[UILabel alloc] init];
    }
    return _like_count;
}
- (UILabel *)ageLabel
{
    if (_ageLabel == nil) {
        _ageLabel = [[UILabel alloc] init];
    }
    return _ageLabel;
}
- (UILabel *)signLabel
{
    if (_signLabel == nil) {
        _signLabel = [[UILabel alloc] init];
    }
    return _signLabel;
}

- (UIButton *)imageView
{
    if (_imageView == nil) {
        _imageView = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _imageView;
}
- (UIImageView *)sexImageView
{
    if (_sexImageView == nil) {
        _sexImageView = [[UIImageView alloc] init];
    }
    return _sexImageView;
}

@end

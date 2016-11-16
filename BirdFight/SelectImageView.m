//
//  SelectImageView.m
//  BirdFight
//
//  Created by 聚米 on 16/11/11.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import "SelectImageView.h"
#import "AutoFillScreenUtils.h"
#import "UIView+ShowView.h"

@interface SelectImageView ()

@property (nonatomic, strong) UIButton * imageBtn;// 选择按钮
@property (nonatomic, strong) UIButton * cameraBtn;// 拍照按钮
@property (nonatomic, strong) UIButton * photoBtn;// 相册按钮
@property (nonatomic, strong) UIButton * cancelBtn;// 取消按钮

@property (nonatomic, strong) UIButton * selectedBtn;

@end

@implementation SelectImageView

#pragma mark 初始化
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
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
    //初始化组建
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(25, 200, 270, 240)];
    view.backgroundColor = [UIColor whiteColor];
    [AutoFillScreenUtils autoLayoutFillScreen:view];
    [self addSubview:view];
    
    // 初始化view控件
    
    _imageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _imageBtn.frame = CGRectMake(100, 40, 70, 70);
    _imageBtn.backgroundColor = [UIColor clearColor];
    [_imageBtn setImage:[UIImage imageNamed:@"peng photo"] forState:UIControlStateNormal];
    [_imageBtn addTarget:self action:@selector(tapBtnToSelect:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:_imageBtn];
    
    _cameraBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _cameraBtn.frame = CGRectMake(95, 120, 29, 15);
    _cameraBtn.backgroundColor = [UIColor clearColor];
    [_cameraBtn setTitle:@"拍照" forState:UIControlStateNormal];
    _cameraBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [_cameraBtn setTitleColor:[UIColor colorWithRed:249/255.0 green:83/255.0 blue:100/255.0 alpha:1] forState:UIControlStateSelected];
    [_cameraBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    _cameraBtn.selected = YES;
    _cameraBtn.tag = 2;
    [_cameraBtn addTarget:self action:@selector(tapBtnCameraOrPhoto:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:_cameraBtn];
    
    UIView * lineView = [[UIView alloc]initWithFrame:CGRectMake(134.5, 120, 1, 15)];
    lineView.backgroundColor = [UIColor lightGrayColor];
    [view addSubview:lineView];
    
    _photoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _photoBtn.frame = CGRectMake(146, 120, 29, 15);
    _photoBtn.backgroundColor = [UIColor clearColor];
    [_photoBtn setTitle:@"相册" forState:UIControlStateNormal];
    _photoBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [_photoBtn setTitleColor:[UIColor colorWithRed:249/255.0 green:83/255.0 blue:100/255.0 alpha:1] forState:UIControlStateSelected];
    [_photoBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    _photoBtn.selected = NO;
    _photoBtn.tag = 3;
    [_photoBtn addTarget:self action:@selector(tapBtnCameraOrPhoto:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:_photoBtn];
    
    _cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _cancelBtn.frame = CGRectMake(120, 175, 30, 30);
    [_cancelBtn setImage:[UIImage imageNamed:@"碰碰 删除"] forState:UIControlStateNormal];
    [_cancelBtn addTarget:self action:@selector(tapBtnForDismiss) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:_cancelBtn];
}

#pragma mark 取消
- (void)tapBtnForDismiss
{
    [self dismiss];
}

#pragma mark 点击选择按钮
-(void)tapBtnToSelect:(UIButton *)button
{
    if (self.block) {
        self.block(button.tag);
    }
    [self dismiss];
}

#pragma mark 点击类型按钮
-(void)tapBtnCameraOrPhoto:(UIButton *)sender
{
    switch (sender.tag) {
        case 2:
        {
            if (_cameraBtn.selected == NO) {
                _cameraBtn.selected = YES;
                _photoBtn.selected = NO;
                _imageBtn.tag = 0;
            }else{
                
            }
            break;
        }
        case 3:
        {
            if (_photoBtn.selected == NO) {
                _photoBtn.selected = YES;
                _cameraBtn.selected = NO;
                _imageBtn.tag = 1;
            }else{
                
            }
            break;
        }
        default:
            break;
    }

}
@end

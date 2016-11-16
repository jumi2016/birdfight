//
//  AuthorizationView.m
//  BirdFight
//
//  Created by 聚米 on 16/10/13.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import "AuthorizationView.h"
#import "UIView+ShowView.h"
#import "AutoFillScreenUtils.h"

@interface AuthorizationView ()

@property (nonatomic, strong) UILabel * label_1;
@property (nonatomic, strong) UILabel * label_2;
@property (nonatomic, strong) UIButton * pushBtn; // 推送权限
@property (nonatomic, strong) UIButton * positionBtn; // 定位权限
@property (nonatomic, strong) UIButton * telListBtn; // 通讯录权限
@property (nonatomic, strong) UIButton * noBtn; // 暂不开启
@property (nonatomic, strong) UIButton * yesBtn; // 开启以上功能

@end

@implementation AuthorizationView

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
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(20, 100, 280, 320)];
    view.backgroundColor = [UIColor whiteColor];
    view.layer.cornerRadius = 6;
    [AutoFillScreenUtils autoLayoutFillScreen:view];
    [self addSubview:view];
    // 取消按钮
    UIButton * cancel = [UIButton buttonWithType:UIButtonTypeCustom];
    cancel.frame = CGRectMake(250, 10, 20, 20);
    [cancel addTarget:self action:@selector(tapBtnForDismiss) forControlEvents:UIControlEventTouchUpInside];
    [cancel setImage:[UIImage imageNamed:@"xxxx"] forState:UIControlStateNormal];
    [view addSubview:cancel];
    // 标题
    _label_1 = [[UILabel alloc]initWithFrame:CGRectMake(60, 35, 160, 25)];
    _label_1.text = @"为了您更好的体验，";
    _label_1.textColor = [UIColor blackColor];
    _label_1.textAlignment = NSTextAlignmentCenter;
    _label_1.backgroundColor = [UIColor clearColor];
    [view addSubview:_label_1];
    _label_2 = [[UILabel alloc]initWithFrame:CGRectMake(60, 60, 160, 25)];
    _label_2.text = @"是否开放以下权限：";
    _label_2.textColor = [UIColor blackColor];
    _label_2.textAlignment = NSTextAlignmentCenter;
    _label_2.backgroundColor = [UIColor clearColor];
    [view addSubview:_label_2];
    // 设置推送权限按钮
    _pushBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _pushBtn.frame = CGRectMake(40, 110, 200, 40);
    [_pushBtn setImage:[UIImage imageNamed:@"pushNo"] forState:UIControlStateNormal];
    [_pushBtn setImage:[UIImage imageNamed:@"pushYes"] forState:UIControlStateSelected];
    _pushBtn.selected = NO;
    _pushBtn.tag = 1;
    [_pushBtn addTarget:self action:@selector(tapPushBtn:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:_pushBtn];
    // 设置定位权限按钮
    _positionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _positionBtn.frame = CGRectMake(40, 160, 200, 40);
    [_positionBtn setImage:[UIImage imageNamed:@"mapNo"] forState:UIControlStateNormal];
    [_positionBtn setImage:[UIImage imageNamed:@"mapYes"] forState:UIControlStateSelected];
    _positionBtn.selected = NO;
    _positionBtn.tag = 3;
    [_positionBtn addTarget:self action:@selector(tapPositionBtn:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:_positionBtn];
    // 设置通讯录权限按钮
    _telListBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _telListBtn.frame = CGRectMake(40, 210, 200, 40);
    [_telListBtn setImage:[UIImage imageNamed:@"telListNo"] forState:UIControlStateNormal];
    [_telListBtn setImage:[UIImage imageNamed:@"telListYes"] forState:UIControlStateSelected];
    _telListBtn.selected = NO;
    _telListBtn.tag = 5;
    [_telListBtn addTarget:self action:@selector(tapAddressListBtn:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:_telListBtn];
    // 设置底部按钮
    _noBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 280, 140, 40)];
    [_noBtn setTitle:@"暂不开启" forState:UIControlStateNormal];
    [_noBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _noBtn.backgroundColor = [UIColor lightGrayColor];
    [_noBtn addTarget:self action:@selector(tapBtnForDismiss) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:_noBtn];
    
    _yesBtn = [[UIButton alloc]initWithFrame:CGRectMake(140, 280, 140, 40)];
    [_yesBtn setTitle:@"开启以上功能" forState:UIControlStateNormal];
    [_yesBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _yesBtn.backgroundColor = [UIColor colorWithRed:249/255.0 green:83/255.0 blue:100/255.0 alpha:1];
    [_yesBtn addTarget:self action:@selector(tapBtnToOpenFunction) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:_yesBtn];

}

#pragma mark 点击推送权限按钮
- (void)tapPushBtn:(UIButton *)sender
{
    if (sender.tag == 1) {
        sender.selected = YES;
        sender.tag++;
        
        
        
    }else{
        sender.selected = NO;
        sender.tag--;
        
        
        
    }
}

#pragma mark 点击定位权限按钮
- (void)tapPositionBtn:(UIButton *)sender
{
    if (sender.tag == 3) {
        sender.selected = YES;
        sender.tag++;
        
        
        
    }else{
        sender.selected = NO;
        sender.tag--;
        
        
        
    }

}

#pragma mark 点击通讯录权限按钮
- (void)tapAddressListBtn:(UIButton *)sender
{
    if (sender.tag == 5) {
        sender.selected = YES;
        sender.tag++;
        
        
        
    }else{
        sender.selected = NO;
        sender.tag--;
        
        
        
    }
}

#pragma mark 取消  暂不开启
- (void)tapBtnForDismiss
{
    [self dismiss];
    // 关闭所有功能权限
    
    
    
    
    if (self.block) {
        self.block();
    }
}

#pragma mark 开启以上功能
- (void)tapBtnToOpenFunction
{
    // 开启选中功能权限,其他关闭
    
    
    
    
    if (self.block) {
        self.block();
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

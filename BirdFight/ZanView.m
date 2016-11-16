//
//  ZanView.m
//  BirdFight
//
//  Created by 聚米 on 16/11/7.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import "ZanView.h"
#import "UserInfo.h"
#import "Masonry.h"

@implementation ZanView

#pragma mark 初始化
-(instancetype)initWithFrame:(CGRect)frame withPeopleModel:(NSMutableArray *)models withPinglunCount:(NSInteger)pinglun_count
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _count = models.count;
        _pinglun_count = pinglun_count;
        
        if (models.count<12) {
            _model_arr = models;
        }else{
            NSArray * arr = models;
            _model_arr = [NSMutableArray arrayWithArray:[arr subarrayWithRange:NSMakeRange(0, 11)]];
        }
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

#pragma mark 初始化
-(void)otherInit
{
    self.backgroundColor = [UIColor whiteColor];
    
    CGFloat w = (self.bounds.size.width-110)/8;
    
    for (int i = 0; i<_model_arr.count; i++) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = i;
        
        CGFloat x;
        CGFloat y;
        if (i<8) {
            x = 20 + (w + 10) * i;
            y = 10 ;
        }else{
            x = 20 + (w + 10) * (i-8);
            y = w + 20;
        }
        
        button.frame = CGRectMake(x, y, w, w);
        button.layer.cornerRadius = w/2;
        button.layer.masksToBounds = YES;
        [button addTarget:self action:@selector(tapHeadImageButton:) forControlEvents:UIControlEventTouchUpInside];
        UserInfo * info = _model_arr[i];
        [button setImage:info.headImage forState:UIControlStateNormal];
        [self addSubview:button];
        
    }
    
    if (_count > 11) {
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(20+(w + 10)*3, w + 20, 150, w)];
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor lightGrayColor];
        label.font = [UIFont systemFontOfSize:13];
        label.textAlignment = NSTextAlignmentLeft;
        label.text = [NSString stringWithFormat:@"等%lu个人给您点了赞",(unsigned long)_count];
        [self addSubview:label];
    }
    
    UILabel * pinglunLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, self.bounds.size.height-21, 100, 20)];
    pinglunLabel.backgroundColor = [UIColor clearColor];
    pinglunLabel.textColor = [UIColor lightGrayColor];
    pinglunLabel.font = [UIFont systemFontOfSize:13];
    pinglunLabel.textAlignment = NSTextAlignmentLeft;
    pinglunLabel.text = [NSString stringWithFormat:@"%ld条评论",(long)_pinglun_count];
    [self addSubview:pinglunLabel];
    
    UIView * lineview = [[UIView alloc]initWithFrame:CGRectMake(20, self.bounds.size.height-1, self.bounds.size.width-20, 1)];
    lineview.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self addSubview:lineview];

}


-(void)tapHeadImageButton:(UIButton *)sender
{
    UserInfo * info = _model_arr[sender.tag];
    
    if (self.block) {
        self.block(info.uid);
    }
}

@end

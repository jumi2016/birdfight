//
//  UIView+ShowView.m
//  拉拉 (product)
//
//  Created by 岳淑霞 on 16/3/29.
//  Copyright © 2016年 岳淑霞. All rights reserved.
//

#import "UIView+ShowView.h"

static UIButton *_cover;

@implementation UIView (ShowView)

//动画
- (void)animatedIn
{
    self.transform = CGAffineTransformMakeScale(1.3, 1.3);
    self.alpha = 0;
    [UIView animateWithDuration:.35 animations:^{
        self.alpha = 1;
        self.transform = CGAffineTransformMakeScale(1, 1);
    }];
}
//动画
- (void)animatedOut
{
    [UIView animateWithDuration:.35 animations:^{
        [self removeFromSuperview];
        [_cover removeFromSuperview];
        _cover = nil;
    }];
}

//界面展示
- (void)show
{
    UIWindow *keywindow = [[UIApplication sharedApplication].windows lastObject];
    keywindow.windowLevel = UIWindowLevelNormal;
    
    // 遮盖
    UIButton *cover = [[UIButton alloc] init];
    cover.backgroundColor = [UIColor blackColor];
    cover.alpha = 0.4;
    [cover addTarget:self action:@selector(animatedOut) forControlEvents:UIControlEventTouchUpInside];
    cover.frame = [UIScreen mainScreen].bounds;
    _cover = cover;
    
    [keywindow addSubview:cover];
    [keywindow addSubview:self];
    
    self.center = CGPointMake(keywindow.bounds.size.width/2.0f,
                              keywindow.bounds.size.height/2.0f);
    
    [self animatedIn];
}
//界面消失
- (void)dismiss
{
    [self animatedOut];
}

-(void)diyView
{
    self.layer.cornerRadius = 20;
    self.layer.masksToBounds = YES;
    self.layer.borderWidth = 1;

    self.backgroundColor = [UIColor whiteColor];
    self.layer.borderColor = [UIColor whiteColor].CGColor;
}


@end

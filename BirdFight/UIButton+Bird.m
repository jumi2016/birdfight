//
//  UIButton+Bird.m
//  BirdFight
//
//  Created by 聚米 on 16/10/11.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import "UIButton+Bird.h"

@implementation UIButton (Bird)

-(void)diyStyle
{
    self.layer.borderWidth = 1;
    self.layer.cornerRadius = 15.0;
    self.layer.masksToBounds = YES;
    [self setAdjustsImageWhenHighlighted:NO];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    self.backgroundColor = [UIColor colorWithRed:249/255.0 green:83/255.0 blue:100/255.0 alpha:1];
    self.layer.borderColor = [[UIColor colorWithRed:249/255.0 green:83/255.0 blue:100/255.0 alpha:1]CGColor];
}

-(void)diyStyleOther
{
    self.layer.borderWidth = 1;
    self.layer.cornerRadius = 15.0;
    self.layer.masksToBounds = YES;
    [self setAdjustsImageWhenHighlighted:NO];
    
    self.backgroundColor = [UIColor whiteColor];
    self.layer.borderColor = [[UIColor whiteColor] CGColor];
}

-(void)setBtnYesOrNo
{
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    self.backgroundColor = [UIColor whiteColor];
    self.layer.cornerRadius = 20;
    self.layer.masksToBounds = YES;
    self.selected = NO;
}

@end

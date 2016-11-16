//
//  MyAlertView.h
//  BirdFight
//
//  Created by 聚米 on 16/10/20.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import <UIKit/UIKit.h>

// 点击按钮跳转界面
typedef void(^TapBtnBlock)(NSString * str);

@interface MyAlertView : UIView

@property (nonatomic, strong) TapBtnBlock block;

-(instancetype)initWithFrame:(CGRect)frame withTitle:(NSString *)title withArray:(NSArray *)arr;

@end

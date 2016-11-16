//
//  AuthorizationView.h
//  BirdFight
//
//  Created by 聚米 on 16/10/13.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import <UIKit/UIKit.h>

// 点击按钮跳转界面
typedef void(^TapBtnBlock)();

@interface AuthorizationView : UIView

@property (nonatomic, strong) TapBtnBlock block;

@end

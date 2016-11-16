//
//  SelectImageView.h
//  BirdFight
//
//  Created by 聚米 on 16/11/11.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import <UIKit/UIKit.h>

// 点击按钮
typedef void(^TapButton)(NSInteger tag);

@interface SelectImageView : UIView

@property (nonatomic, strong) TapButton block;

@end

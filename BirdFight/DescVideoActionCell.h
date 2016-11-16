//
//  DescVideoActionCell.h
//  BirdFight
//
//  Created by 聚米 on 16/11/5.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TapCaoZuoButton)(UIButton * sender);

@interface DescVideoActionCell : UITableViewCell

@property (nonatomic, strong) TapCaoZuoButton block;

@property (nonatomic, strong) UIImageView * mainImageView;
@property (nonatomic, strong) UIButton * playButton;

@end

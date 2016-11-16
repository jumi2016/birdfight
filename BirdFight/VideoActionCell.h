//
//  VideoActionCell.h
//  BirdFight
//
//  Created by 聚米 on 16/10/24.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TapCaoZuoButton)(UIButton * sender);

typedef void(^TapNameButton)(NSString * uid);

@interface VideoActionCell : UITableViewCell

@property (nonatomic, strong) TapCaoZuoButton block;

@property (nonatomic, strong) TapNameButton name_block;

@property (nonatomic, strong) UIImageView * mainImageView;
@property (nonatomic, strong) UIButton * playButton;

@end

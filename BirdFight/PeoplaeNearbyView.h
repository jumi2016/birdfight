//
//  PeoplaeNearbyView.h
//  BirdFight
//
//  Created by 聚米 on 16/10/26.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserInfo.h"

typedef void(^TapButtonBlock)();

@interface PeoplaeNearbyView : UIView

/** 头像 */
@property (nonatomic, strong) UIButton * headImageBtn;

@property (nonatomic, strong) TapButtonBlock block;

@property (nonatomic, strong) UserInfo * info; // 附近人信息

-(instancetype)initWithFrame:(CGRect)frame withPeopleInfo:(UserInfo *)info;

@end

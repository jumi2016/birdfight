//
//  ZanView.h
//  BirdFight
//
//  Created by 聚米 on 16/11/7.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TapBtnBlock)(NSString * uid);

@interface ZanView : UIView

@property (nonatomic, strong) TapBtnBlock block;

@property (nonatomic, strong) NSMutableArray * model_arr; // 赞的人数组

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, assign) NSInteger pinglun_count;

-(instancetype)initWithFrame:(CGRect)frame withPeopleModel:(NSMutableArray *)models withPinglunCount:(NSInteger)pinglun_count;

@end

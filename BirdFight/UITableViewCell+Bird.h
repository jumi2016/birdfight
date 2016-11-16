//
//  UITableViewCell+Bird.h
//  BirdFight
//
//  Created by 聚米 on 16/10/24.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIButton+WebCache.h"
#import "UIImageView+WebCache.h"
#import "UserInfo.h"

@class ActionInfoModel;

@protocol UITableViewCellDelegate <NSObject>

@optional

/** 点击cell上的视频按钮回调 */
- (void)didTapVideoButton:(NSString *)video_url;

/** 点击动态cell上的头像按钮回调 */
- (void)didTapHeadImageButton:(NSString *)uid;

/** 点击cell上的图片回调 */
- (void)didTapImageAtIndex:(NSInteger)index WithURL:(NSArray *)image_url;
- (void)didTapImageAtIndex:(NSInteger)index WithImage:(NSArray *)image_url; // 测试

/** 点击cell上的赞按钮回调 */
- (void)didTapZanButton:(NSString *)actionID;

/** 点击cell上的评论按钮回调 */
- (void)didTapPinglunButton:(NSString *)actionID;

/** 点击cell上的么么按钮回调 */
- (void)didTapMemeButton:(NSString *)actionID;

/** 点击评论cell上的头像按钮回调 */
- (void)didTapPingLunHeadImageButton:(NSString *)uid;


- (void)reloadCellHeightForModel:(ActionInfoModel *)model atIndexPath:(NSIndexPath *)indexPath;

@end

@interface UITableViewCell (Bird)

/** 代理属性 */
@property (nonatomic,weak) id<UITableViewCellDelegate> delegate;

/**
 * 设置cell展示数据
 */
- (void)setCellInfo:(id)action;


@end

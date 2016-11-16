//
//  DescImagesActionCell.h
//  BirdFight
//
//  Created by 聚米 on 16/11/5.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TapCaoZuoButton)(UIButton * sender);

typedef void(^TapImageBlock)(NSInteger index,NSArray *dataSource,NSIndexPath *indexpath);

@interface DescImagesActionCell : UITableViewCell

@property (nonatomic, strong) TapCaoZuoButton block;

/**
 *  点击图片的block
 */
@property (nonatomic, strong) TapImageBlock imageblock;


@end

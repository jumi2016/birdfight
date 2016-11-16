//
//  ActionTableViewController.h
//  BirdFight
//
//  Created by 聚米 on 16/10/24.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TextActionModel.h"
#import "ImageActionModel.h"
#import "VideoActionModel.h"

typedef void(^TapTextCellBlock)(TextActionModel * action); // 点击cell传递
typedef void(^TapImageCellBlock)(ImageActionModel * action);
typedef void(^TapVideoCellBlock)(VideoActionModel * action);

@interface ActionTableViewController : UITableViewController

@property (nonatomic, strong) TapTextCellBlock text_block;
@property (nonatomic, strong) TapImageCellBlock image_block;
@property (nonatomic, strong) TapVideoCellBlock video_block;

@end

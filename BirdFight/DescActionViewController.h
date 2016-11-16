//
//  DescActionViewController.h
//  BirdFight
//
//  Created by 聚米 on 16/11/8.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActionInfoModel.h"
#import "TextActionModel.h"
#import "ImageActionModel.h"
#import "VideoActionModel.h"
#import "pingLunInfoModel.h"

@interface DescActionViewController : UIViewController

// 动态

@property (nonatomic, strong) ActionInfoModel * model;
@property (nonatomic, strong) TextActionModel * text_model;
@property (nonatomic, strong) ImageActionModel * image_model;
@property (nonatomic, strong) VideoActionModel * video_model;

@end

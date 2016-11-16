//
//  ImageActionModel.h
//  BirdFight
//
//  Created by 聚米 on 16/10/31.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import "ActionInfoModel.h"

@interface ImageActionModel : ActionInfoModel

/** 网络获取的URL */
@property(nonatomic,strong) NSString *imageUrl;

/** 解析的String型URL数组 */
@property(nonatomic,strong,readonly) NSArray *images_url;


// 测试
@property (nonatomic, strong) NSArray * image_arr;

@end

//
//  PingLun_2_ActionCell.h
//  BirdFight
//
//  Created by 聚米 on 16/10/24.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TapNameBtn)(NSString * uid);

@interface PingLun_2_ActionCell : UITableViewCell

@property (nonatomic, strong) TapNameBtn block;

@end

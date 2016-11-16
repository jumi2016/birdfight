//
//  DescOneImageActionCell.h
//  BirdFight
//
//  Created by 聚米 on 16/11/5.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TapCaoZuoButton)(UIButton * sender);

@interface DescOneImageActionCell : UITableViewCell

@property (nonatomic, strong) TapCaoZuoButton block;

@end

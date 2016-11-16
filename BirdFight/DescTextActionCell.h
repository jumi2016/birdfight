//
//  DescTextActionCell.h
//  BirdFight
//
//  Created by 聚米 on 16/11/4.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TapCaoZuoButton)(UIButton * sender);

@interface DescTextActionCell : UITableViewCell

@property (nonatomic, strong) TapCaoZuoButton block;

@end

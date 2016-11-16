//
//  ChooseB_TableViewCell.h
//  BirdFight
//
//  Created by 聚米 on 16/10/20.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TapButtonBlock)(UIButton * button);

@interface ChooseB_TableViewCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UIButton *button_all;
@property (weak, nonatomic) IBOutlet UIButton *button_boy;
@property (weak, nonatomic) IBOutlet UIButton *button_girl;

@property (nonatomic, strong) TapButtonBlock block;

@end

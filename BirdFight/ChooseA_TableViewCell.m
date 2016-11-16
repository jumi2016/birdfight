//
//  ChooseA_TableViewCell.m
//  BirdFight
//
//  Created by 聚米 on 16/10/20.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import "ChooseA_TableViewCell.h"

@implementation ChooseA_TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [_button_1 setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [_button_1 setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    
    [_button_2 setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [_button_2 setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];

    
}

- (IBAction)tapBtn_1:(UIButton *)sender
{
    _button_1.selected = YES;
    _button_2.selected = NO;
    if (self.block) {
        self.block(sender);
    }
}

- (IBAction)tapBtn_2:(id)sender
{
    _button_1.selected = NO;
    _button_2.selected = YES;
    if (self.block) {
        self.block(sender);
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

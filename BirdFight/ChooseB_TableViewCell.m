//
//  ChooseB_TableViewCell.m
//  BirdFight
//
//  Created by 聚米 on 16/10/20.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import "ChooseB_TableViewCell.h"

@interface ChooseB_TableViewCell ()

@property (nonatomic, strong) UIButton * selectedBtn;

@end

@implementation ChooseB_TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [_button_all setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [_button_all setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    
    [_button_boy setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [_button_boy setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    
    [_button_girl setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [_button_girl setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];

    
}

- (IBAction)tapButton:(UIButton *)sender
{
    
    if (sender != self.selectedBtn) {
        self.selectedBtn.selected = NO;
        sender.selected = YES;
        self.selectedBtn = sender;
        
    }else{
        self.selectedBtn.selected = YES;
    }
    
    if (self.block) {
        self.block(sender);
    }

}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

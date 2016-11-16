//
//  ChooseD_TableViewCell.m
//  BirdFight
//
//  Created by 聚米 on 16/10/21.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import "ChooseD_TableViewCell.h"

#define Button_Size button.bounds.size

@interface ChooseD_TableViewCell ()

@property (nonatomic, strong) UIButton * selectedBtn;

@end

@implementation ChooseD_TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    NSArray * arr = @[_button_1,_button_2,_button_3,_button_4,_button_5,_button_6,_button_7,_button_8,_button_9,_button_10,_button_11,_button_12,_button_13,_button_14,_button_15,_button_16,_button_17];
    for (int i = 0; i<17; i++) {
        UIButton * button = arr[i];
    
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        
        
//        UIImageView * imageV = [[UIImageView alloc]initWithFrame:CGRectMake(Button_Size.width-13, Button_Size.height-13, 10, 10 )];
//        imageV.image = [UIImage imageNamed:@"tick_red"];
//        if (button.selected == YES) {
//            [button addSubview:imageV];
//        }else{
//            [imageV removeFromSuperview];
//        }
    }
    
    
}

- (IBAction)tapBodyPartsBtn:(UIButton *)sender
{
    NSString * str = [NSString string];

    
    if (sender != self.selectedBtn) {
        self.selectedBtn.selected = NO;
        sender.selected = YES;
        self.selectedBtn = sender;
        
        str = _selectedBtn.titleLabel.text;
        
    }else{
        
        if (self.selectedBtn.selected == YES) {
            self.selectedBtn.selected = NO;
            
            str = @"";
            
        }else{
            self.selectedBtn.selected = YES;
            
            str = _selectedBtn.titleLabel.text;
        }
    }
    
    //通知传值
    NSDictionary * dic = [NSDictionary dictionaryWithObject:str forKey:@"bodyPart"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"bodyPart" object:self userInfo:dic];

}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

//
//  BodyPart_Boy_TableViewCell.m
//  BirdFight
//
//  Created by 聚米 on 16/10/22.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import "BodyPart_Boy_TableViewCell.h"

#define Button_Size button.bounds.size

@interface BodyPart_Boy_TableViewCell ()

@property (nonatomic, strong) UIButton * selectedBtn;

@end

@implementation BodyPart_Boy_TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    NSArray * arr = @[_button_1,_button_2,_button_3,_button_4,_button_5,_button_6,_button_7,_button_8,_button_9];
    for (int i = 0; i<9; i++) {
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

- (IBAction)TapButton:(UIButton *)sender
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
    NSDictionary * dic = [NSDictionary dictionaryWithObject:str forKey:@"bodyPart_boy"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"bodyPart_boy" object:self userInfo:dic];
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

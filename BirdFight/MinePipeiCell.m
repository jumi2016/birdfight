//
//  MinePipeiCell.m
//  BirdFight
//
//  Created by 聚米 on 16/11/11.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import "MinePipeiCell.h"
#import "UITableViewCell+Bird.h"
#import "LikeModel.h"
#import "ButtonItem.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width

@interface MinePipeiCell ()

@property (weak, nonatomic) IBOutlet UIButton *headImageBtn;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *sexImageVIew;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;

@property (nonatomic, weak) id<UITableViewCellDelegate> delegate; // 代理属性
@property (nonatomic, strong) NSString * uid; // 用户标识符

@end

@implementation MinePipeiCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    _headImageBtn.layer.cornerRadius = 25;
    _headImageBtn.layer.masksToBounds = YES;
    
    UIView * deleteView = [[UIView alloc]initWithFrame:CGRectMake(kScreenWidth, 0, kScreenWidth, self.contentView.frame.size.height)];
    deleteView.backgroundColor = [UIColor colorWithRed:249/255.0 green:83/255.0 blue:100/255.0 alpha:1];
    [self.contentView addSubview:deleteView];
    
    ButtonItem * deleteBtn = [[ButtonItem alloc]initWithFrame:CGRectMake(0, 0, 80, self.contentView.frame.size.height) withImageName:@"dustbin" withImageWidth:30 withImageHeightPercentInItem:0.7 withTitle:nil withFontSize:0 withFontColor:nil withGap:0];
    [deleteView addSubview:deleteBtn];
    
}

-(void)setCellInfo:(LikeModel *)action
{
    [_headImageBtn setImage:action.headImage forState:UIControlStateNormal];
    _nameLabel.text = action.name;
    if ([action.sex isEqualToString:@"男"]) {
        _sexImageVIew.image = [UIImage imageNamed:@"nan_people"];
    }else if([action.sex isEqualToString:@"女"]){
        _sexImageVIew.image = [UIImage imageNamed:@"nv_people"];
    }
    _ageLabel.text = action.age;
    _timeLabel.text = action.time_t;
    _distanceLabel.text = action.distance;
    if ([action.type isEqualToString:@"tolike"]) {
        _contentLabel.text = @"你“超级赞”了Ta";
    }else if ([action.type isEqualToString:@"fromlike"]){
        _contentLabel.text = @"Ta“超级赞”了你";
    }
}

- (IBAction)tapHeadImageBtn:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(didTapHeadImageButton:)]) {
        [self.delegate didTapHeadImageButton:_uid];
    }
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

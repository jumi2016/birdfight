//
//  DescVideoActionCell.m
//  BirdFight
//
//  Created by 聚米 on 16/11/5.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import "DescVideoActionCell.h"
#import "UITableViewCell+HYBMasonryAutoCellHeight.h"
#import "Masonry.h"
#import "UITableViewCell+Bird.h"

#import "VideoActionModel.h"

@interface DescVideoActionCell ()

@property (strong, nonatomic)  UIButton *headImageBtn;
@property (strong, nonatomic)  UILabel *nameLabel;
@property (strong, nonatomic)  UIImageView *sexImage;
@property (strong, nonatomic)  UILabel *ageLabel;
@property (strong, nonatomic)  UIButton *handleBtn;

@property (strong, nonatomic)  UILabel *contentLabel;


@property (strong, nonatomic)  UILabel *timeLabel;
@property (strong, nonatomic)  UILabel *distanceLabel;

@property (strong, nonatomic)  UIButton *supportBtn;
@property (strong, nonatomic)  UILabel *supportLabel;

@property (strong, nonatomic)  UIButton *memeBtn;
@property (strong, nonatomic)  UILabel *memeLabel;


@property (nonatomic, weak) id<UITableViewCellDelegate> delegate; // 代理属性
@property (nonatomic, strong) NSString * uid; // 用户标识符

@property (nonatomic, strong) ActionInfoModel * actionModel; // 动态模型
@property (nonatomic, strong) NSString * video_url; // 存储视频url



@end



@implementation DescVideoActionCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        __weak __typeof(self) weakSelf = self;
        // 分割线
        UIView * lineVIew = [[UIView alloc]init];
        lineVIew.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [self.contentView addSubview:lineVIew];
        [lineVIew mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.top.mas_equalTo(0);
            make.height.mas_equalTo(1);
        }];
        
        // 头像
        self.headImageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.headImageBtn.contentMode = UIViewContentModeScaleAspectFit;
        _headImageBtn.backgroundColor = [UIColor clearColor];
        _headImageBtn.layer.cornerRadius = 25;
        _headImageBtn.layer.masksToBounds = YES;
        [_headImageBtn addTarget:self action:@selector(tapHeadImage:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.headImageBtn];
        [self.headImageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.top.mas_equalTo(lineVIew.mas_bottom).offset(15);
            make.width.height.mas_equalTo(50);
        }];
        
        // 操作按钮
        self.handleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.handleBtn.contentMode = UIViewContentModeScaleAspectFit;
        self.handleBtn.backgroundColor = [UIColor clearColor];
        [self.handleBtn setImage:[UIImage imageNamed:@"caozuo"] forState:UIControlStateNormal];
        [self.handleBtn addTarget:self action:@selector(tapHandle:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.handleBtn];
        [self.handleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-20);
            make.top.mas_equalTo(lineVIew.mas_bottom).offset(15);
            make.width.mas_equalTo(30);
            make.height.mas_equalTo(20);
        }];
        
        // 姓名
        self.nameLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.nameLabel];
        self.nameLabel.preferredMaxLayoutWidth = screenWidth - 135;
        self.nameLabel.numberOfLines = 1;
        self.nameLabel.font = [UIFont systemFontOfSize:16];
        _nameLabel.backgroundColor = [UIColor clearColor];
        _nameLabel.textColor = [UIColor blackColor];
        _nameLabel.textAlignment = NSTextAlignmentLeft;
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(weakSelf.headImageBtn.mas_right).offset(15);
            make.top.mas_equalTo(weakSelf.headImageBtn);
            make.right.mas_equalTo(weakSelf.handleBtn.mas_left).offset(-10);
            make.height.mas_equalTo(20);
        }];
        
        // 性别
        self.sexImage = [[UIImageView alloc]init];
        self.sexImage.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:self.sexImage];
        [self.sexImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(weakSelf.nameLabel);
            make.top.mas_equalTo(weakSelf.nameLabel.mas_bottom).offset(10);
            make.width.mas_equalTo(10);
            make.height.mas_equalTo(15);
        }];
        
        // 年龄
        self.ageLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.ageLabel];
        self.ageLabel.numberOfLines = 1;
        self.ageLabel.font = [UIFont systemFontOfSize:14];
        self.ageLabel.backgroundColor = [UIColor clearColor];
        self.ageLabel.textColor = [UIColor darkGrayColor];
        self.ageLabel.textAlignment = NSTextAlignmentLeft;
        [self.ageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(weakSelf.sexImage.mas_right).offset(10);
            make.top.mas_equalTo(weakSelf.sexImage);
            make.width.mas_equalTo(40);
            make.height.mas_equalTo(15);
        }];
        
        // 文字
        self.contentLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.contentLabel];
        self.contentLabel.numberOfLines = 0;
        self.nameLabel.preferredMaxLayoutWidth = screenWidth - 40;
        self.contentLabel.font = [UIFont systemFontOfSize:15];
        self.contentLabel.backgroundColor = [UIColor clearColor];
        self.contentLabel.textColor = [UIColor darkGrayColor];
        self.contentLabel.textAlignment = NSTextAlignmentLeft;
        [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.right.mas_equalTo(-20);
            make.top.mas_equalTo(weakSelf.headImageBtn.mas_bottom).offset(10);
        }];
        
        // 视频
        _mainImageView = [[UIImageView alloc]init];
        _mainImageView.userInteractionEnabled = YES;
        _mainImageView.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_mainImageView];
        [_mainImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.right.mas_equalTo(-20);
            make.top.mas_equalTo(weakSelf.contentLabel.mas_bottom).offset(10);
            make.height.mas_equalTo(200);
        }];
        _playButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _playButton.backgroundColor = [UIColor clearColor];
        [_playButton setImage:[UIImage imageNamed:@"video_play_btn_bg"] forState:UIControlStateNormal];
        [_mainImageView addSubview:_playButton];
        [_playButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(110);
            make.right.mas_equalTo(-110);
            make.top.mas_equalTo(weakSelf.contentLabel.mas_bottom).offset(70);
            make.height.mas_equalTo(60);
        }];
        
        
        // 时间
        self.timeLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.timeLabel];
        self.timeLabel.numberOfLines = 1;
        self.timeLabel.font = [UIFont systemFontOfSize:13];
        self.timeLabel.backgroundColor = [UIColor clearColor];
        self.timeLabel.textColor = [UIColor lightGrayColor];
        self.timeLabel.textAlignment = NSTextAlignmentLeft;
        [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.top.mas_equalTo(weakSelf.mainImageView.mas_bottom).offset(10);
            make.width.mas_equalTo(60);
            make.height.mas_equalTo(20);
        }];
        
        // 距离
        self.distanceLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.distanceLabel];
        self.distanceLabel.numberOfLines = 1;
        self.distanceLabel.font = [UIFont systemFontOfSize:13];
        self.distanceLabel.backgroundColor = [UIColor clearColor];
        self.distanceLabel.textColor = [UIColor darkGrayColor];
        self.distanceLabel.textAlignment = NSTextAlignmentLeft;
        [self.distanceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(weakSelf.timeLabel.mas_right).offset(10);
            make.top.mas_equalTo(weakSelf.timeLabel);
            make.width.mas_equalTo(40);
            make.height.mas_equalTo(20);
        }];
        
        CGFloat m = screenWidth-310;
        
        // 赞按钮
        self.supportBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.supportBtn.contentMode = UIViewContentModeScaleAspectFit;
        self.supportBtn.backgroundColor = [UIColor clearColor];
        [_supportBtn setImage:[UIImage imageNamed:@"zan"] forState:UIControlStateNormal];
        [_supportBtn setImage:[UIImage imageNamed:@"dianzan"] forState:UIControlStateSelected];
        _supportBtn.selected = NO;
        [self.supportBtn addTarget:self action:@selector(tapSupport:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.supportBtn];
        [self.supportBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(weakSelf.distanceLabel.mas_right).offset(m);
            make.top.mas_equalTo(weakSelf.timeLabel);
            make.width.mas_equalTo(40);
            make.height.mas_equalTo(20);
        }];
        
        // 赞label
        self.supportLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.supportLabel];
        self.supportLabel.numberOfLines = 1;
        self.supportLabel.font = [UIFont systemFontOfSize:13];
        self.supportLabel.backgroundColor = [UIColor clearColor];
        self.supportLabel.textColor = [UIColor blackColor];
        self.supportLabel.textAlignment = NSTextAlignmentRight;
        [self.supportLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(weakSelf.supportBtn.mas_right).offset(0);
            make.top.mas_equalTo(weakSelf.timeLabel);
            make.width.mas_equalTo(30);
            make.height.mas_equalTo(20);
        }];
        
        // 么么按钮
        self.memeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.memeBtn.contentMode = UIViewContentModeScaleAspectFit;
        self.memeBtn.backgroundColor = [UIColor clearColor];
        [_memeBtn setImage:[UIImage imageNamed:@"meme"] forState:UIControlStateNormal];
        [self.memeBtn addTarget:self action:@selector(tapReview:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.memeBtn];
        [self.memeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(weakSelf.supportLabel.mas_right).offset(10);
            make.top.mas_equalTo(weakSelf.mainImageView.mas_bottom).offset(0);
            make.width.mas_equalTo(40);
            make.height.mas_equalTo(30);
        }];
        
        // 么么label
        self.memeLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.memeLabel];
        self.memeLabel.numberOfLines = 1;
        self.memeLabel.font = [UIFont systemFontOfSize:13];
        self.memeLabel.backgroundColor = [UIColor clearColor];
        self.memeLabel.text = @"么么";
        self.memeLabel.textColor = [UIColor blackColor];
        self.memeLabel.textAlignment = NSTextAlignmentRight;
        [self.memeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(weakSelf.memeBtn.mas_right).offset(0);
            make.top.mas_equalTo(weakSelf.timeLabel);
            make.width.mas_equalTo(30);
            make.height.mas_equalTo(20);
        }];
        
        self.hyb_lastViewInCell = self.memeLabel;
        self.hyb_bottomOffsetToCell = 10;

        
    }
    
    return self;
}

#pragma mark 设置数据
-(void)setCellInfo:(VideoActionModel *)action
{
    _uid = action.uid;
    [_headImageBtn setImage:action.headImage forState:UIControlStateNormal];
    _nameLabel.text = action.name;
    if ([action.sex isEqualToString:@"男"]) {
        _sexImage.image = [UIImage imageNamed:@"男"];
    }else if ([action.sex isEqualToString:@"女"]){
        _sexImage.image = [UIImage imageNamed:@"女"];
    }
    _ageLabel.text = action.age;
    _contentLabel.text = action.content;
    _timeLabel.text = action.time_t;
    _distanceLabel.text = action.stance;
    
    if ([action.zanCount isEqualToString:@"0"]) {
        _supportLabel.text = @"赞";
    }else{
        _supportLabel.text = action.zanCount;
    }
    
    self.video_url = action.mp4URL;
    
    
}

#pragma mark 点击头像按钮回调
- (void)tapHeadImage:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(didTapHeadImageButton:)]) {
        [self.delegate didTapHeadImageButton:_uid];
    }
}

#pragma mark 点击赞按钮回调
- (void)tapSupport:(UIButton *)sender
{
    if (sender.selected == NO) {
        sender.selected = YES;
    }else{
        sender.selected = NO;
    }
    
    
    if ([self.delegate respondsToSelector:@selector(didTapZanButton:)]) {
        [self.delegate didTapZanButton:_uid];
    }
}

#pragma mark 点击么么按钮回调
- (void)tapReview:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(didTapMemeButton:)]) {
        [self.delegate didTapMemeButton:_uid];
    }
}

#pragma mark 点击操作按钮
- (void)tapHandle:(UIButton *)sender
{
    if (self.block) {
        self.block(sender);
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

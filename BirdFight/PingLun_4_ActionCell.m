//
//  PingLun_4_ActionCell.m
//  BirdFight
//
//  Created by 聚米 on 16/11/4.
//  Copyright © 2016年 聚米. All rights reserved.
//

#import "PingLun_4_ActionCell.h"
#import "pingLunInfoModel.h"
#import "UITableViewCell+Bird.h"
#import "UITableViewCell+HYBMasonryAutoCellHeight.h"
#import "Masonry.h"
#import "UILabel+YBAttributeTextTapAction.h"

@interface PingLun_4_ActionCell ()<YBAttributeTapActionDelegate>

@property (nonatomic, strong) UIButton * headImageBtn;
@property (nonatomic, strong) UIButton * name_one_Btn;

@property (nonatomic, strong) UILabel * distanceL;
@property (nonatomic, strong) UILabel * timeL;

@property (strong, nonatomic)  UILabel *pinglun_label;

@property (nonatomic, weak) id<UITableViewCellDelegate> delegate; // 代理属性

@property (nonatomic, strong) NSString * uid_one; // 用户标识uid
@property (nonatomic, strong) NSString * uid_two; // 用户标识uid

@end


@implementation PingLun_4_ActionCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        __weak __typeof(self) weakSelf = self;
        // 头像
        self.headImageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.headImageBtn.contentMode = UIViewContentModeScaleAspectFit;
        _headImageBtn.backgroundColor = [UIColor clearColor];
        _headImageBtn.layer.cornerRadius = 15;
        _headImageBtn.layer.masksToBounds = YES;
        [_headImageBtn addTarget:self action:@selector(tapHeadImage:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.headImageBtn];
        [self.headImageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.top.mas_equalTo(6);
            make.width.height.mas_equalTo(30);
        }];
        
        // 时间
        self.timeL = [[UILabel alloc] init];
        [self.contentView addSubview:self.timeL];
        self.timeL.numberOfLines = 1;
        self.timeL.font = [UIFont systemFontOfSize:12];
        self.timeL.backgroundColor = [UIColor clearColor];
        self.timeL.textColor = [UIColor lightGrayColor];
        self.timeL.textAlignment = NSTextAlignmentRight;
        [self.timeL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(weakSelf.headImageBtn);
            make.right.mas_equalTo(-20);
            make.width.mas_equalTo(60);
            make.height.mas_equalTo(15);
        }];
        
        // 距离
        self.distanceL = [[UILabel alloc] init];
        [self.contentView addSubview:self.distanceL];
        self.distanceL.numberOfLines = 1;
        self.distanceL.font = [UIFont systemFontOfSize:12];
        self.distanceL.backgroundColor = [UIColor clearColor];
        self.distanceL.textColor = [UIColor lightGrayColor];
        self.distanceL.textAlignment = NSTextAlignmentRight;
        [self.distanceL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(weakSelf.timeL.mas_left).offset(-10);
            make.top.mas_equalTo(weakSelf.headImageBtn);
            make.width.mas_equalTo(40);
            make.height.mas_equalTo(15);
        }];
        
        
        // 姓名
        self.name_one_Btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:self.name_one_Btn];
        self.name_one_Btn.contentMode = UIViewContentModeScaleAspectFit;
        self.name_one_Btn.titleLabel.font = [UIFont systemFontOfSize:12];
        self.name_one_Btn.backgroundColor = [UIColor clearColor];
        [self.name_one_Btn setTitleColor:[UIColor colorWithRed:80/255.0 green:227/255.0 blue:194/255.0 alpha:1] forState:UIControlStateNormal];
        self.name_one_Btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [_name_one_Btn addTarget:self action:@selector(tapHeadImage:) forControlEvents:UIControlEventTouchUpInside];
        [self.name_one_Btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(weakSelf.headImageBtn.mas_right).offset(10);
            make.top.mas_equalTo(weakSelf.headImageBtn);
            make.right.mas_equalTo(weakSelf.distanceL.mas_left).offset(-10);
            make.height.mas_equalTo(15);
        }];
        
        // 固定label
        self.pinglun_label = [[UILabel alloc] init];
        [self.contentView addSubview:self.pinglun_label];
        self.pinglun_label.preferredMaxLayoutWidth = self.contentView.bounds.size.width;
        self.pinglun_label.numberOfLines = 0;
        self.pinglun_label.lineBreakMode = NSLineBreakByWordWrapping;
        //设置是否有点击效果，默认是YES
        self.pinglun_label.enabledTapEffect = YES;
        self.pinglun_label.textAlignment = NSTextAlignmentLeft;
        [self.pinglun_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(weakSelf.name_one_Btn.mas_bottom).offset(2);
            make.left.mas_equalTo(weakSelf.name_one_Btn);
            make.right.mas_equalTo(-20);
        }];
        
        // 分割线
        UIView * lineVIew = [[UIView alloc]init];
        lineVIew.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [self.contentView addSubview:lineVIew];
        [lineVIew mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(weakSelf.name_one_Btn);
            make.right.mas_equalTo(0);
            make.top.mas_equalTo(weakSelf.pinglun_label.mas_bottom).offset(10);
            make.height.mas_equalTo(1);
        }];
        
        
        self.hyb_lastViewInCell = lineVIew;
    }
    
    return self;
}


#pragma mark 设置数据
-(void)setCellInfo:(pingLunInfoModel *)info
{
    
    _uid_one = info.uid_one;
    _uid_two = info.uid_two;
    
    [_headImageBtn setImage:info.headImage forState:UIControlStateNormal];
    [_name_one_Btn setTitle:info.name_one forState:UIControlStateNormal];
    _distanceL.text = info.distance;
    _timeL.text = info.time_t;
    
    NSString * two_str = info.name_two;
    NSString * content_str = info.content;
    
    NSMutableArray * ranges = [NSMutableArray array]; // 修改文字颜色
    NSMutableArray * actionStrs = [NSMutableArray array]; // 添加点击事件
    
    NSString * str = [NSString string];
    
    if ([two_str isEqualToString:@""]) {
        str = [NSString stringWithFormat:@"%@",content_str];
    }else{
        str = [NSString stringWithFormat:@"回复 %@ : %@",two_str,content_str];
    }
    
    // 点击
    [actionStrs addObject:two_str];
    
    // 特殊字符串
    
    NSRange range1 = [str rangeOfString:two_str];
    [ranges addObject:[NSValue valueWithRange:range1]];
    
    // 转换成富文本字符串
    NSMutableAttributedString * attStr = [[NSMutableAttributedString alloc] initWithString:str];
    [attStr addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13],NSForegroundColorAttributeName:[UIColor darkGrayColor]} range:NSMakeRange(0, str.length)];
    
    // 最好设置一下行高，不设的话默认是0
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = 0;
    [attStr addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, str.length)];
    
    // 给指定文字添加颜色
    for (NSValue * rangeVal in ranges) {
        [attStr addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName:[UIColor colorWithRed:80/255.0 green:227/255.0 blue:194/255.0 alpha:1]} range:rangeVal.rangeValue];
    }
    
    self.pinglun_label.attributedText = attStr;
    
    // 给指定文字添加点击事件
    [self.pinglun_label yb_addAttributeTapActionWithStrings:actionStrs delegate:self];
    
}

#pragma mark 点击头像,姓名1按钮回调
- (void)tapHeadImage:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(didTapPingLunHeadImageButton:)]) {
        [self.delegate didTapPingLunHeadImageButton:_uid_one];
    }
}

#pragma mark 点击评论中姓名2
// 点击代理
- (void)yb_attributeTapReturnString:(NSString *)string range:(NSRange)range index:(NSInteger)index
{
    if (index == 0) {
        if (self.block) {
            self.block(_uid_two);
        }
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
